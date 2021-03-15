import 'package:flutter/material.dart';
import 'package:places/ui/screen/res/themes.dart';

/// ThemeController - Контроллер уведомляющий об изменении темы
/// [toLight()] - выбор светлой темы
/// [toDark()] - Выбор темной темы
class ThemeController with ChangeNotifier {
  bool _isDark;
  ThemeData _themeData;

  ThemeController({bool isDark = false}) {
    _isDark = isDark;
    setTheme();
  }

  bool getThemeController() => _isDark;

  void toDark() {
    _isDark = true;
    setTheme();
  }

  void toLight() {
    _isDark = false;
    setTheme();
  }

  ThemeData getTheme() => _themeData;

  void setTheme() {
    _themeData = _isDark ? darkTheme : lightTheme;
    notifyListeners();
  }
}
