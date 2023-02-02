import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/core/widgets/task_tile.dart';
import 'package:todo_app_flutter/features/home_page/controller/home_page_controller.dart';
import 'package:todo_app_flutter/services/notification_services.dart';
import 'package:todo_app_flutter/themes/themes.dart';
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
  final HomePageController _controller = Get.find<HomePageController>();
  @override
  void initState() {
    super.initState();
    notificationServices = NotificationServices();
    _controller.getTasks();
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
          children: [
            const Header(),
            const DatePickerListView(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _controller.allTasks.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: TaskTile(task: _controller.allTasks[index]),
                          ),
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
