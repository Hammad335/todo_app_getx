import 'package:flutter/material.dart';

const Color blue = Color(0xFF4e5ae8);
const Color yellow = Color(0xFFFFB756);
const Color pink = Color(0xFFff4667);
const Color white = Colors.white;
const Color darkGrey = Color(0xFF121212);
const Color headerDark = Color(0xFF424242);
const Color primaryLight = blue;
const Color primaryDark = darkGrey;

class Themes {
  static final light = ThemeData(
    primaryColor: primaryLight,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: primaryDark,
    brightness: Brightness.dark,
  );
}
