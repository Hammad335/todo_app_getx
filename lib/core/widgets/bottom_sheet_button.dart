import 'package:flutter/material.dart';
import 'package:todo_app_flutter/themes/themes.dart';

class BottomSheetButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color color;
  final Size size;
  final bool isCloseButton;

  const BottomSheetButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
    required this.size,
    this.isCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: size.width * 0.9,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isCloseButton ? Colors.transparent : color,
          border: Border.all(
            color: isCloseButton ? grey : color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: isCloseButton
              ? Themes.titleStyle
              : Themes.titleStyle.copyWith(color: white),
        ),
      ),
    );
  }
}
