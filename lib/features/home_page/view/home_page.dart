import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/core/widgets/task_tile.dart';
import 'package:todo_app_flutter/features/home_page/controller/home_page_controller.dart';
import 'package:todo_app_flutter/themes/themes.dart';
import 'package:todo_app_flutter/utils/utils.dart';
import '../../../core/models/task.dart';
import '../../../core/widgets/bottom_sheet_button.dart';
import '../../../core/widgets/date_picker_list_view.dart';
import '../../../core/widgets/header.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomePageController _controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: Utils.customAppBar(
        context: context,
        notificationServices: _controller.notificationServices,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Header(isDarkModeOn: Get.isDarkMode),
            DatePickerListView(controller: _controller),
            const SizedBox(height: 28),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _controller.allTasks.length,
                  itemBuilder: (context, index) {
                    final Task task = _controller.allTasks[index];
                    _controller.setScheduleNotifications(task);
                    if (task.repeat == 'Daily' ||
                        task.date ==
                            DateFormat.yMd()
                                .format(_controller.selectedDate.value)) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: GestureDetector(
                              onTap: () => _showBottomSheet(context, task),
                              child: TaskTile(task: task),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    final size = MediaQuery.of(context).size;
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 6),
        height: task.isCompleted == 1 ? size.height * 0.24 : size.height * 0.32,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? darkGrey : white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? greyLight : greyDark,
              ),
            ),
            const Spacer(),
            if (task.isCompleted != 1)
              BottomSheetButton(
                label: 'Task Completed',
                color: primaryLight,
                size: size,
                onTap: () {
                  _controller.markTaskCompleted(task.id!);
                  Get.back();
                },
              ),
            BottomSheetButton(
              label: 'Delete Task',
              color: red,
              size: size,
              onTap: () {
                _controller.deleteTask(task.id!);
                Get.back();
              },
            ),
            const SizedBox(height: 8),
            BottomSheetButton(
              label: 'Close',
              color: red,
              onTap: () {
                Get.back();
              },
              size: size,
              isCloseButton: true,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
