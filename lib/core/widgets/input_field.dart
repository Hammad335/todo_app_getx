import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/themes.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? widget;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.title,
    required this.hint,
    this.widget,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Themes.titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: grey,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: null != widget ? true : false,
                    autofocus: false,
                    cursorColor: Get.isDarkMode ? greyLight : greyDark,
                    controller: controller,
                    style: Themes.titleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: Themes.hintStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                null == widget
                    ? const SizedBox.shrink()
                    : Container(
                        child: widget,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
