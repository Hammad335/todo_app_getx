import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/features/home_page/controller/home_page_controller.dart';
import 'package:todo_app_flutter/themes/themes.dart';

class DatePickerListView extends StatelessWidget {
  final HomePageController controller;

  const DatePickerListView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryLight,
        selectedTextColor: white,
        dateTextStyle: Themes.dateTextStyle,
        dayTextStyle: Themes.dayTextStyle,
        monthTextStyle: Themes.monthTextStyle,
        onDateChange: (DateTime date) {
          controller.selectedDate.value = date;
          // controller.selectedDate.refresh();
          controller.getTasks();
        },
      ),
    );
  }
}
