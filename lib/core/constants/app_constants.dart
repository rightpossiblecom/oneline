class AppConstants {
  // App info
  static const String appName = 'OneLine';
  static const String appVersion = '1.0.0';

  // Game defaults
  static const int initialLevel = 1;
  static const int totalLevels = 30;

  // UI Spacing
  static const double paddingXS = 4;
  static const double paddingS = 8;
  static const double paddingM = 16;
  static const double paddingL = 24;
  static const double paddingXL = 32;

  // Game canvas
  static const double dotsRadiusSmall = 6;
  static const double dotsRadiusMedium = 8;
  static const double dotsRadiusLarge = 10;
  static const double lineWidth = 3;
  static const double touchTolerance = 20;

  // Animation durations
  static const Duration shortDuration = Duration(milliseconds: 300);
  static const Duration mediumDuration = Duration(milliseconds: 500);
  static const Duration longDuration = Duration(milliseconds: 1000);

  // Hive boxes
  static const String gameDataBox = 'game_data';
  static const String settingsBox = 'settings';

  // Storage keys
  static const String currentLevelKey = 'current_level';
  static const String soundEnabledKey = 'sound_enabled';
  static const String hapticEnabledKey = 'haptic_enabled';
  static const String themeKey = 'theme_mode';
  static const String levelsCompletedKey = 'levels_completed';
}
