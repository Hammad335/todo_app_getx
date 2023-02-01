import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/utils/utils.dart';

import '../../../themes/themes.dart';

class TaskPageController extends GetxController {
  late BuildContext context;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  DateTime? datePicker;
  RxString startTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
  RxString endTime = '9:30 AM'.obs;
  RxInt selectedRemindTime = 5.obs;
  RxString selectedRepeatTime = 'None'.obs;
  RxInt selectedColorIndex = 0.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  void validateData() {
    if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Utils.showSnackBar();
    } else {
      //todo add data to database
      Get.back();
    }
  }

  void setPickedTime(TimeOfDay? pickedTime, bool isStartTime) {
    if (null != pickedTime) {
      final formattedTime = pickedTime.format(context);
      if (isStartTime) {
        startTime.value = formattedTime;
      } else {
        endTime.value = formattedTime;
      }
    }
  }

  void setPickedDate() {
    if (null != datePicker) {
      selectedDate.value = datePicker!;
    }
  }
}
