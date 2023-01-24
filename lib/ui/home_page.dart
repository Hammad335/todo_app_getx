import 'package:flutter/material.dart';
import 'package:todo_app_flutter/services/notification_services.dart';
import 'package:todo_app_flutter/services/theme_services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotificationServices notificationServices;
  @override
  void initState() {
    super.initState();
    notificationServices = NotificationServices();
    // notificationServices.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: Column(
        children: [
          const Text(
            'Theme Data',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }

  _customAppBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notificationServices.displayNotification();
        },
        child: const Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: [
        const Icon(
          Icons.person,
          size: 20,
        ),
      ],
    );
  }
}
