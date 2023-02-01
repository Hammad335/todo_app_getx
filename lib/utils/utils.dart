import 'package:flutter/material.dart';
import 'package:todo_app_flutter/services/theme_services.dart';
import 'package:get/get.dart';
import '../services/notification_services.dart';
import '../themes/themes.dart';

class Utils {
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
