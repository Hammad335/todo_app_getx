import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {
  final _storage = GetStorage();
  final _key = 'isDarkModeOn';

  _saveThemeToStorage(bool isDarkModeOn) => _storage.write(_key, isDarkModeOn);
  bool _isDarkModeOn() => _storage.read(_key) ?? false;
  ThemeMode get themeMode => _isDarkModeOn() ? ThemeMode.dark : ThemeMode.light;
  void switchTheme() {
    Get.changeThemeMode(_isDarkModeOn() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToStorage(!_isDarkModeOn());
  }
}
