import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  bool _soundEnabled = true;
  bool _hapticEnabled = true;
  ThemeMode _themeMode = ThemeMode.system;

  bool get soundEnabled => _soundEnabled;
  bool get hapticEnabled => _hapticEnabled;
  ThemeMode get themeMode => _themeMode;

  void setSound(bool enabled) {
    _soundEnabled = enabled;
    notifyListeners();
  }

  void setHaptic(bool enabled) {
    _hapticEnabled = enabled;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
