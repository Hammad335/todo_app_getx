import 'package:get/get.dart';
import 'package:todo_app_flutter/core/models/task.dart';
import 'package:todo_app_flutter/db_helper/db_helper.dart';

class HomePageController extends GetxController {
  final DBHelper _dbHelper = DBHelper();
  RxList<Task> allTasks = RxList();

  Future<void> getTasks() async {
    List<Map<String, Object?>> tasks = await _dbHelper.getAllTasks();
    allTasks.assignAll(tasks.map((task) => Task.fromJson(task)).toList());
  }

  Future<void> delete(int id) async {
    try {
      await _dbHelper.delete(id);
      getTasks();
    } catch (exception) {
      print(exception.toString());
    }
  }
}
