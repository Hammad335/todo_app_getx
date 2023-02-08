import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/core/models/task.dart';
import 'package:todo_app_flutter/db_helper/db_helper.dart';
import '../../../services/notification_services.dart';
import '../../../utils/utils.dart';

class HomePageController extends GetxController {
  late NotificationServices notificationServices;
  final DBHelper _dbHelper = DBHelper();
  RxList<Task> allTasks = RxList();
  Rx<DateTime> selectedDate = DateTime
      .now()
      .obs;

  HomePageController() {
    getTasks();
    notificationServices = NotificationServices();
  }

  void showDialog(String payload) {
    try {
      Map<String, String> data = {
        'title': payload.split(',')[0],
        'note': payload.split(',')[1],
      };
      Utils.showDialog(title: data['title']!, note: data['note']!);
    }
    catch (exception) {
      print(exception.toString());
      Utils.showDialog(title: '', note: '');
    }
  }

  void setScheduleNotifications(Task task) {
    final DateTime date = DateFormat.jm().parse(task.startTime);
    final String formattedDate = DateFormat('HH:mm').format(date);
    final dateArray = formattedDate.toString().split(':');
    notificationServices.scheduledNotification(
      hours: int.parse(dateArray[0]),
      minutes: int.parse(dateArray[1]),
      task: task,
    );
  }

  Future<void> getTasks() async {
    List<Map<String, Object?>> tasks = await _dbHelper.getAllTasks();
    allTasks.assignAll(tasks.map((task) => Task.fromJson(task)).toList());
  }

  Future<void> deleteTask(int id) async {
    try {
      await _dbHelper.delete(id);
      getTasks();
    } catch (exception) {
      print(exception.toString());
    }
  }

  Future<void> markTaskCompleted(int id) async {
    try {
      await _dbHelper.update(id);
      getTasks();
    } catch (exception) {
      print(exception.toString());
    }
  }
}
