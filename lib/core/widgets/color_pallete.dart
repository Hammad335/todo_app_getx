import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/features/add_task_page/controller/task_page_controller.dart';
import 'package:todo_app_flutter/themes/themes.dart';

class ColorPallete extends StatelessWidget {
  final TaskPageController controller;

  const ColorPallete({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Themes.titleStyle,
        ),
        const SizedBox(height: 8),
        Wrap(
          children: List<Widget>.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                controller.selectedColorIndex.value = index;
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Obx(
                  () => CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryLight
                        : index == 1
                            ? pink
                            : yellow,
                    child: controller.selectedColorIndex.value == index
                        ? const Icon(
                            Icons.done,
                            color: white,
                            size: 16,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
