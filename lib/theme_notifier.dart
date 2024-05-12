import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
