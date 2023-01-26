import 'package:flutter/material.dart';
import '../themes/themes.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 50,
        decoration: BoxDecoration(
          color: primaryLight,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
