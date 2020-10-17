import 'package:CatchTheGoal/core/constants/enums/app_theme_enum.dart';
import 'package:CatchTheGoal/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

//notifier is like event in kafka
class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;
  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
