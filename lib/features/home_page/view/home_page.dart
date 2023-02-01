import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/services/notification_services.dart';
import 'package:todo_app_flutter/utils/utils.dart';

import '../../../core/widgets/date_picker_list_view.dart';
import '../../../core/widgets/header.dart';

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
      backgroundColor: context.theme.backgroundColor,
      appBar: Utils.customAppBar(
        context: context,
        notificationServices: notificationServices,
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Header(),
            DatePickerListView(),
          ],
        ),
      ),
    );
  }
}
