import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskPageController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  DateTime? datePicker;
  TextEditingController titleController = TextEditingController();

  void setPickedDate() {
    if (null != datePicker) {
      selectedDate.value = datePicker!;
    }
  }
}
