import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'dart:convert';

class StorageService {
  static final StorageService _instance = StorageService._internal();

  late Box<String> _gameDataBox;
  late Box<String> _settingsBox;

  StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  Future<void> init() async {
    await Hive.initFlutter();
    _gameDataBox = await Hive.openBox<String>(AppConstants.gameDataBox);
    _settingsBox = await Hive.openBox<String>(AppConstants.settingsBox);
  }

  // Game Progress
  int getCurrentLevel() {
    final data = _gameDataBox.get(AppConstants.currentLevelKey);
    return data != null
        ? int.tryParse(data) ?? AppConstants.initialLevel
        : AppConstants.initialLevel;
  }

  Future<void> setCurrentLevel(int level) async {
    await _gameDataBox.put(AppConstants.currentLevelKey, level.toString());
  }

  List<int> getCompletedLevels() {
    final data = _gameDataBox.get(AppConstants.levelsCompletedKey);
    if (data == null) return [];
    try {
      final List<dynamic> decoded = jsonDecode(data);
      return decoded.cast<int>();
    } catch (e) {
      return [];
    }
  }

  Future<void> markLevelComplete(int level) async {
    final completed = getCompletedLevels();
    if (!completed.contains(level)) {
      completed.add(level);
      await _gameDataBox.put(
        AppConstants.levelsCompletedKey,
        jsonEncode(completed),
      );
      await setCurrentLevel(level + 1);
    }
  }

  // Settings
  bool isSoundEnabled() {
    final data = _settingsBox.get(AppConstants.soundEnabledKey);
    return data == null ? true : data == 'true';
  }

  Future<void> setSoundEnabled(bool enabled) async {
    await _settingsBox.put(AppConstants.soundEnabledKey, enabled.toString());
  }

  bool isHapticEnabled() {
    final data = _settingsBox.get(AppConstants.hapticEnabledKey);
    return data == null ? true : data == 'true';
  }

  Future<void> setHapticEnabled(bool enabled) async {
    await _settingsBox.put(AppConstants.hapticEnabledKey, enabled.toString());
  }

  ThemeMode getThemeMode() {
    final data = _settingsBox.get(AppConstants.themeKey);
    if (data == null) return ThemeMode.system;
    return ThemeMode.values.firstWhere(
      (mode) => mode.toString() == data,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _settingsBox.put(AppConstants.themeKey, mode.toString());
  }

  // Game Data Management
  Future<void> clearAllData() async {
    await _gameDataBox.clear();
    await _settingsBox.clear();
  }

  Future<void> reset() async {
    await clearAllData();
  }
}
