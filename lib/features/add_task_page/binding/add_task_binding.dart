import 'package:get/get.dart';
import 'package:todo_app_flutter/features/add_task_page/controller/task_page_controller.dart';

class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskPageController());
  }
}
