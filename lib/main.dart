import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_flutter/db_helper/db_helper.dart';
import 'package:todo_app_flutter/features/add_task_page/binding/add_task_binding.dart';
import 'package:todo_app_flutter/features/add_task_page/view/add_task_page.dart';
import 'package:todo_app_flutter/services/theme_services.dart';
import 'features/home_page/view/home_page.dart';
import 'themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().themeMode,
      initialRoute: '/home-page',
      getPages: [
        GetPage(
            name: '/home-page',
            page: () => HomePage(),
            binding: AddTaskBinding()),
        GetPage(name: '/add-task-page', page: () => AddTaskPage()),
      ],
    );
  }
}
