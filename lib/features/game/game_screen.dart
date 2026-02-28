import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_service.dart';
import 'game_view_model.dart';
import '../../core/constants/app_constants.dart';
import '../../core/services/storage_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late GameService _gameService;
  late StorageService _storageService;

  @override
  void initState() {
    super.initState();
    _gameService = GameService();
    _storageService = StorageService();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<GameViewModel>().setCurrentLevel(
          _storageService.getCurrentLevel(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, viewModel, child) {
        final currentLevel = _gameService.getLevel(viewModel.currentLevel);
        final colorScheme = Theme.of(context).colorScheme;

        if (viewModel.levelComplete) {
          return _buildLevelCompleteScreen(context, viewModel, colorScheme);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Level ${viewModel.currentLevel}'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => viewModel.retryLevel(),
              ),
            ],
          ),
          body: Column(
            children: [
              // Progress indicator
              Padding(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                child: Text(
                  '${viewModel.dotsConnected(currentLevel.dots)}/${currentLevel.dots.length} dots',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),

              // Game canvas
              Expanded(
                child: GestureDetector(
                  onPanStart: (details) {
                    viewModel.startDrawing(details.localPosition);
                  },
                  onPanUpdate: (details) {
                    viewModel.addPoint(details.localPosition);
                    _checkGameState(context, viewModel, currentLevel);
                  },
                  onPanEnd: (details) {
                    viewModel.endDrawing();
                    _checkGameState(context, viewModel, currentLevel);
                  },
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: CustomPaint(
                      painter: GameCanvasPainter(
                        drawnPath: viewModel.drawnPath,
                        dots: currentLevel.dots,
                        colorScheme: colorScheme,
                      ),
                      size: Size.infinite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _checkGameState(
    BuildContext context,
    GameViewModel viewModel,
    GameLevel currentLevel,
  ) {
    final dotsConnected = viewModel.dotsConnected(currentLevel.dots);

    // Check if all dots are connected
    if (dotsConnected == currentLevel.dots.length && viewModel.isDrawing) {
      // Success!
      final isPerfect = _gameService.isPathClean(
        viewModel.drawnPath,
        currentLevel.dots,
      );
      viewModel.markLevelComplete(isPerfect: isPerfect);
      _storageService.markLevelComplete(viewModel.currentLevel);
    }

    // Check if player lifted finger before completing
    if (!viewModel.isDrawing &&
        dotsConnected < currentLevel.dots.length &&
        viewModel.drawnPath.isNotEmpty) {
      viewModel.markLevelFailed();
    }
  }

  Widget _buildLevelCompleteScreen(
    BuildContext context,
    GameViewModel viewModel,
    ColorScheme colorScheme,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Level ${viewModel.currentLevel} Complete!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (viewModel.showPerfectBadge) ...[
            const SizedBox(height: AppConstants.paddingL),
            Text(
              '✨ Perfect! ✨',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
            ),
          ],
          const SizedBox(height: AppConstants.paddingXL),
          FilledButton(
            onPressed: () => viewModel.nextLevel(),
            child: const Text('Next Level'),
          ),
          const SizedBox(height: AppConstants.paddingM),
          OutlinedButton(
            onPressed: () => viewModel.retryLevel(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class GameCanvasPainter extends CustomPainter {
  final List<Offset> drawnPath;
  final List<Offset> dots;
  final ColorScheme colorScheme;

  GameCanvasPainter({
    required this.drawnPath,
    required this.dots,
    required this.colorScheme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw grid background (optional subtle grid)
    _drawBackground(canvas, size);

    // Draw the dots
    _drawDots(canvas);

    // Draw the drawn path
    if (drawnPath.isNotEmpty) {
      _drawPath(canvas);
    }
  }

  void _drawBackground(Canvas canvas, Size size) {
    // Optional: Draw subtle grid
    final paint = Paint()
      ..color = colorScheme.outlineVariant.withValues(alpha: 0.1)
      ..strokeWidth = 0.5;

    const gridSize = 50.0;
    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  void _drawDots(Canvas canvas) {
    final paint = Paint()
      ..color = colorScheme.primary
      ..style = PaintingStyle.fill;

    for (var dot in dots) {
      canvas.drawCircle(dot, AppConstants.dotsRadiusMedium, paint);
    }
  }

  void _drawPath(Canvas canvas) {
    final paint = Paint()
      ..color = colorScheme.primary
      ..strokeWidth = AppConstants.lineWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    for (int i = 0; i < drawnPath.length - 1; i++) {
      canvas.drawLine(drawnPath[i], drawnPath[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(GameCanvasPainter oldDelegate) {
    return oldDelegate.drawnPath != drawnPath || oldDelegate.dots != dots;
  }
}
