import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'core/theme/app_theme.dart';
import 'core/services/storage_service.dart';
import 'features/home/home_screen.dart';
import 'features/home/home_view_model.dart';
import 'features/game/game_screen.dart';
import 'features/game/game_view_model.dart';
import 'features/settings/settings_screen.dart';
import 'features/settings/settings_view_model.dart';
import 'features/about/about_screen.dart';

final storageService = StorageService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await storageService.init();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _themeMode = storageService.getThemeMode();
  }

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => GameViewModel()),
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
      ],
      child: MaterialApp(
        title: 'OneLine',
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeMode,
        home: _AppNavigator(onThemeModeChanged: _setThemeMode),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class _AppNavigator extends StatefulWidget {
  final Function(ThemeMode) onThemeModeChanged;

  const _AppNavigator({required this.onThemeModeChanged});

  @override
  State<_AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<_AppNavigator> {
  String _currentScreen = 'home';

  void _navigate(String screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  void _goHome() {
    setState(() {
      _currentScreen = 'home';
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case 'game':
        return GameScreen();
      case 'settings':
        return SettingsScreen(onBack: _goHome);
      case 'about':
        return AboutScreen(onBack: _goHome);
      default:
        return HomeScreen(onNavigate: _navigate);
    }
  }
}
