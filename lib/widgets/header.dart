import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/themes/themes.dart';
import 'package:get/get.dart';
import 'custom_button.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: Themes.headingStyle,
              ),
              Text(
                'Today',
                style: Themes.subHeadingStyle,
              ),
            ],
          ),
          CustomButton(
            label: '+ Add Task',
            onTap: () => Get.toNamed('add-task-page'),
          ),
        ],
      ),
    );
  }
}
