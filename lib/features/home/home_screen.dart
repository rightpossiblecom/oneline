import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_constants.dart';
import '../../core/services/storage_service.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  final Function(String) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StorageService _storageService;

  @override
  void initState() {
    super.initState();
    _storageService = StorageService();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final currentLevel = _storageService.getCurrentLevel();
        context.read<HomeViewModel>().setCurrentLevel(currentLevel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('OneLine'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingXL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App title
                  Text(
                    'OneLine',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingM),

                  // Subtitle
                  Text(
                    'Connect all dots with one line',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingXL),
                  const SizedBox(height: AppConstants.paddingXL),

                  // Current level display
                  Container(
                    padding: const EdgeInsets.all(AppConstants.paddingL),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Current Level',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: AppConstants.paddingS),
                        Text(
                          '${viewModel.currentLevel}',
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingXL),
                  const SizedBox(height: AppConstants.paddingXL),

                  // Start/Continue button
                  FilledButton(
                    onPressed: () => widget.onNavigate('game'),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingL,
                        vertical: AppConstants.paddingM,
                      ),
                      child: Text('Play', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingM),

                  // Settings button
                  OutlinedButton(
                    onPressed: () => widget.onNavigate('settings'),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingL,
                        vertical: AppConstants.paddingM,
                      ),
                      child: Text('Settings'),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingM),

                  // About button
                  OutlinedButton(
                    onPressed: () => widget.onNavigate('about'),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingL,
                        vertical: AppConstants.paddingM,
                      ),
                      child: Text('About'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
