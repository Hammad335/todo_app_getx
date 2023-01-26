import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/features/add_task_page/controller/task_page_controller.dart';
import 'package:todo_app_flutter/utils/utils.dart';
import 'package:todo_app_flutter/themes/themes.dart';
import '../../../widgets/input_field.dart';

class AddTaskPage extends StatelessWidget {
  final TaskPageController _controller = Get.find<TaskPageController>();
  AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: Utils.customAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: Themes.subHeadingStyle,
              ),
              const InputField(
                title: 'Title',
                hint: 'Enter your title',
              ),
              const InputField(
                title: 'Note',
                hint: 'Enter your note',
              ),
              Obx(
                () => InputField(
                  title: 'Date',
                  hint: DateFormat.yMd().format(_controller.selectedDate.value),
                  widget: IconButton(
                    onPressed: () {
                      _getDateFromUser(context);
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Get.isDarkMode ? white : greyDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser(BuildContext context) async {
    _controller.datePicker = await showDatePicker(
      context: context,
      initialDate: _controller.selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    _controller.setPickedDate();
  }
}
