import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppConfig {

  static const String THEME_KEY = 'theme_key';
  final GetStorage storage = GetStorage();

  static Future<bool> init() async {
    return GetStorage.init();
  }

  bool get isDarkMode => Get.isDarkMode;

  void saveTheme(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    storage.write(THEME_KEY, themeMode.toString());
  }

  ThemeMode getTheme() {
    String theme = storage.read(THEME_KEY);
    if (theme.isEmpty) {
      return ThemeMode.system;
    }
    return theme == ThemeMode.dark.toString() ? ThemeMode.dark : ThemeMode.light;
  }

}