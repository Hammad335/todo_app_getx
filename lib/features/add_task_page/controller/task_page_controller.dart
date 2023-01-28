import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskPageController extends GetxController {
  late BuildContext context;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  DateTime? datePicker;
  RxString startTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
  RxString endTime = '9:30 AM'.obs;
  RxInt selectedRemindTime = 5.obs;
  RxString selectedRepeatTime = 'None'.obs;
  TextEditingController titleController = TextEditingController();

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
