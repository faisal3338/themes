import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_themes.dart';

class ThemeProvider with ChangeNotifier {
  AppTheme _currentTheme = AppThemes.themes.first;
  bool _useDynamicColor = true;

  AppTheme get currentTheme => _currentTheme;
  bool get useDynamicColor => _useDynamicColor;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeName = prefs.getString('theme');
    _useDynamicColor = prefs.getBool('useDynamicColor') ?? true;
    if (themeName != null) {
      _currentTheme = AppThemes.getThemeByName(themeName);
    }
    notifyListeners();
  }

  void setTheme(AppTheme theme) async {
    _currentTheme = theme;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme.name);
  }

  void toggleDynamicColor() async {
    _useDynamicColor = !_useDynamicColor;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('useDynamicColor', _useDynamicColor);
  }
}
