import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color blue = Color(0xFF4e5ae8);
const Color yellow = Color(0xFFFFB756);
const Color pink = Color(0xFFff4667);
const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color red = Colors.red;
Color? greyLight = Colors.grey[100];
Color? greyDark = Colors.grey[700];
const Color darkGrey = Color(0xFF121212);
const Color headerDark = Color(0xFF424242);
const Color primaryLight = blue;
const Color primaryDark = darkGrey;

class Themes {
  static final light = ThemeData(
    backgroundColor: white,
    primaryColor: primaryLight,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: primaryDark,
    primaryColor: primaryDark,
    brightness: Brightness.dark,
  );

  static TextStyle get headingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : grey,
    ));
  }

  static TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode ? white : black,
    ));
  }

  static TextStyle get titleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Get.isDarkMode ? white : black,
    ));
  }

  static TextStyle get hintStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? greyLight : greyDark,
    ));
  }

  static TextStyle get dateTextStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: grey,
      ),
    );
  }

  static TextStyle get dayTextStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: grey,
      ),
    );
  }

  static TextStyle get monthTextStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: grey,
      ),
    );
  }

  static TextStyle get notificationTitleStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 20,
        // fontWeight: FontWeight.w600,
        color: black,
      ),
    );
  }

  static TextStyle get notificationSubtitleStyle {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 18,
        // fontWeight: FontWeight.w600,
        color: greyDark,
      ),
    );
  }
}
