import 'package:chuck_norris/src/shared/services/AppConfig.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  final AppConfig appConfig;

  HomeViewModel(this.appConfig);

  void toggleTheme() {
    appConfig
        .saveTheme(appConfig.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
