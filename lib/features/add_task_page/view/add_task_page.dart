import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/features/add_task_page/controller/task_page_controller.dart';
import 'package:todo_app_flutter/utils/utils.dart';
import 'package:todo_app_flutter/themes/themes.dart';
import '../../../widgets/input_field.dart';
import '../../../constants/constants.dart';

class AddTaskPage extends StatelessWidget {
  final TaskPageController _controller = Get.find<TaskPageController>();
  AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.context = context;
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
                      color: iconColor,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: InputField(
                        title: 'Start Time',
                        hint: _controller.startTime.value,
                        widget: IconButton(
                          onPressed: () {
                            _showTimePicker(
                                context: context, isStartTime: true);
                          },
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: iconColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InputField(
                        title: 'End Time',
                        hint: _controller.endTime.value,
                        widget: IconButton(
                          onPressed: () {
                            _showTimePicker(
                                context: context, isStartTime: false);
                          },
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: iconColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < 2; i++)
                Obx(
                  () => InputField(
                    title: i == 0 ? 'Remind' : 'Repeat',
                    hint: i == 0
                        ? '${_controller.selectedRemindTime.value} minutes early'
                        : '${_controller.selectedRepeatTime}',
                    widget: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: iconColor,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      underline: const SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(10),
                      onChanged: (value) {
                        i == 0
                            ? _controller.selectedRemindTime.value =
                                int.parse(value!)
                            : _controller.selectedRepeatTime.value = value!;
                      },
                      items: ((i == 0 ? remindTimeList : repeatTimeList))
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _showTimePicker(
      {required BuildContext context, required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_controller.startTime.value.split(':')[0]),
        minute:
            int.parse(_controller.startTime.value.split(':')[1].split(' ')[0]),
      ),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    _controller.setPickedTime(pickedTime, isStartTime);
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
