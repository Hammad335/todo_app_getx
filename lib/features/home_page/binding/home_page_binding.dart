import 'package:get/get.dart';
import 'package:todo_app_flutter/features/home_page/controller/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
