import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/core/models/task.dart';
import 'package:todo_app_flutter/db_helper/db_helper.dart';
import 'package:todo_app_flutter/utils/utils.dart';

class TaskPageController extends GetxController {
  late BuildContext context;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString startTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
  RxString endTime = '9:30 AM'.obs;
  RxInt selectedRemindTime = 5.obs;
  RxString selectedRepeatTime = 'None'.obs;
  RxInt selectedColorIndex = 0.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final DBHelper _dbHelper = DBHelper();

  void validateData() {
    if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Utils.showSnackBar();
    } else {
      // add to database
      _addTaskToDb();
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

  void setPickedDate(DateTime? pickedDate) {
    if (null != pickedDate) {
      selectedDate.value = pickedDate;
    }
  }

  Future<void> _addTaskToDb() async {
    Task task = Task(
      title: titleController.text,
      note: noteController.text,
      date: DateFormat.yMd().format(selectedDate.value),
      startTime: startTime.value,
      endTime: endTime.value,
      color: selectedColorIndex.value,
      remind: selectedRemindTime.value,
      repeat: selectedRepeatTime.value,
      isCompleted: 0,
    );

    try {
      int id = await _dbHelper.insert(task);
    } catch (exception) {
      print(exception.toString());
    }
  }
}
