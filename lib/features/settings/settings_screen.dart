import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';
import '../../core/services/storage_service.dart';
import 'settings_view_model.dart';

class SettingsScreen extends StatefulWidget {
  final Function() onBack;

  const SettingsScreen({super.key, required this.onBack});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late StorageService _storageService;

  @override
  void initState() {
    super.initState();
    _storageService = StorageService();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final viewModel = context.read<SettingsViewModel>();
        viewModel.setSound(_storageService.isSoundEnabled());
        viewModel.setHaptic(_storageService.isHapticEnabled());
        viewModel.setThemeMode(_storageService.getThemeMode());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer<SettingsViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: widget.onBack,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Sound toggle
                Padding(
                  padding: const EdgeInsets.all(AppConstants.paddingM),
                  child: Card(
                    child: ListTile(
                      title: const Text('Sound Effects'),
                      trailing: Switch(
                        value: viewModel.soundEnabled,
                        onChanged: (value) async {
                          viewModel.setSound(value);
                          await _storageService.setSoundEnabled(value);
                        },
                      ),
                    ),
                  ),
                ),

                // Haptic feedback toggle
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  child: Card(
                    child: ListTile(
                      title: const Text('Haptic Feedback'),
                      trailing: Switch(
                        value: viewModel.hapticEnabled,
                        onChanged: (value) async {
                          viewModel.setHaptic(value);
                          await _storageService.setHapticEnabled(value);
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingM),

                // Theme mode selector
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  child: Card(
                    child: ListTile(
                      title: const Text('Theme'),
                      trailing: DropdownButton<ThemeMode>(
                        value: viewModel.themeMode,
                        onChanged: (ThemeMode? newValue) async {
                          if (newValue != null) {
                            viewModel.setThemeMode(newValue);
                            await _storageService.setThemeMode(newValue);
                          }
                        },
                        items: ThemeMode.values.map((ThemeMode mode) {
                          return DropdownMenuItem<ThemeMode>(
                            value: mode,
                            child: Text(
                              mode.name.replaceFirst(
                                mode.name[0],
                                mode.name[0].toUpperCase(),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingL),
                const Divider(),
                const SizedBox(height: AppConstants.paddingL),

                // Clear App Data button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  child: OutlinedButton.icon(
                    onPressed: () => _showClearDataDialog(context),
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Clear App Data'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorScheme.error,
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingL),
                const Divider(),
                const SizedBox(height: AppConstants.paddingL),

                // Privacy Policy
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  child: Card(
                    child: ListTile(
                      title: const Text('Privacy Policy'),
                      trailing: const Icon(Icons.open_in_new),
                      onTap: () =>
                          _launchURL('https://www.example.com/privacy'),
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingM),

                // Terms of Service
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  child: Card(
                    child: ListTile(
                      title: const Text('Terms of Service'),
                      trailing: const Icon(Icons.open_in_new),
                      onTap: () => _launchURL('https://www.example.com/terms'),
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingM),

                // App Version
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  child: Card(
                    child: ListTile(
                      title: const Text('Version'),
                      trailing: Text(AppConstants.appVersion),
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingL),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showClearDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear App Data?'),
          content: const Text(
            'This will reset all progress and settings. This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _storageService.clearAllData();
                if (context.mounted) {
                  Navigator.pop(context);
                  widget.onBack();
                }
              },
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
