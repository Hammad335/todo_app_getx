import 'package:flutter/material.dart';
import 'package:todo_app_flutter/services/theme_services.dart';
import 'package:get/get.dart';
import '../services/notification_services.dart';
import '../themes/themes.dart';

class Utils {
  static void showDialog({required String title, required String note}) {
    if (title.isEmpty && note.isEmpty) return;
    Get.defaultDialog(
      title: 'Task Reminder \u23F1',
      titleStyle: Themes.headingStyle.copyWith(
        color: black,
      ),
      backgroundColor: white,
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: Themes.notificationTitleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              note,
              style: Themes.notificationSubtitleStyle,
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryLight),
                ),
                child: const Text('Dismiss'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showSnackBar() {
    Get.snackbar(
      'Required',
      'Please fill the fields properly!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.isDarkMode ? greyLight : grey,
      colorText: black,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      borderRadius: 20,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: red,
      ),
    );
  }

  static PreferredSizeWidget customAppBar({
    required BuildContext context,
    NotificationServices? notificationServices,
  }) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          if (null != notificationServices) {
            ThemeServices().switchTheme();
            notificationServices.displayNotification();
          } else {
            Get.back();
          }
        },
        child: Icon(
          null == notificationServices
              ? Icons.arrow_back_ios
              : Get.isDarkMode
                  ? Icons.wb_sunny_outlined
                  : Icons.nightlight_round,
          size: 22,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(
            Get.isDarkMode ? 'images/user_light.png' : 'images/user_dark.png',
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(width: 8)
      ],
    );
  }
}
