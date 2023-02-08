import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_app_flutter/features/home_page/controller/home_page_controller.dart';
import '../core/models/task.dart';

class NotificationServices {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationServices() {
    initializeNotification();
    requestIOSPermissions();
  }

  initializeNotification() async {
    _configureLocalTimeZone();
    final initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  Future<void> selectNotification(String? payload) async {
    try {
      if (null != payload && payload.isNotEmpty) {
        Get.find<HomePageController>().showDialog(payload);
      }
    } catch (exception) {
      rethrow;
    }
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(
      const Text('Welcome to flutter'),
    );
  }

  // request for permission: ios
  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // display notification on theme change
  displayNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      icon: 'app_icon',
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Theme Changed',
      Get.isDarkMode ? 'Activated Light Theme' : 'Activated Dark Theme',
      platformChannelSpecifics,
      payload: null,
    );
    // scheduledNotification();
  }

  // display notification after scheduled time
  scheduledNotification({
    required int hours,
    required int minutes,
    required Task task,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id!.toInt(),
        task.title,
        'Your task time just started',
        _convertDateTime(hours, minutes),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your channel id',
            'your channel name',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            icon: 'app_icon',
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: '${task.title},${task.note}');
  }

  _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  tz.TZDateTime _convertDateTime(int hours, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleTime =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hours, minutes);
    if (scheduleTime.isBefore(now)) {
      scheduleTime.add(const Duration(days: 1));
    }
    return scheduleTime;
  }
}
