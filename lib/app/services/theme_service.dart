import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  bool loadThemeFromBox() => _box.read(_key) ?? false;

  void _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    bool currentIsDarkMode = loadThemeFromBox();
    // Switch to opposite theme
    bool newIsDarkMode = !currentIsDarkMode;

    // Apply theme change
    Get.changeThemeMode(newIsDarkMode ? ThemeMode.dark : ThemeMode.light);

    // Save new state
    _saveThemeToBox(newIsDarkMode);
  }
}
