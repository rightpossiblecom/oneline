import 'package:flutter/material.dart';

class GameViewModel extends ChangeNotifier {
  int _currentLevel = 1;
  List<Offset> _drawnPath = [];
  bool _isDrawing = false;
  bool _levelComplete = false;
  bool _levelFailed = false;
  bool _showPerfectBadge = false;

  int get currentLevel => _currentLevel;
  List<Offset> get drawnPath => _drawnPath;
  bool get isDrawing => _isDrawing;
  bool get levelComplete => _levelComplete;
  bool get levelFailed => _levelFailed;
  bool get showPerfectBadge => _showPerfectBadge;

  void setCurrentLevel(int level) {
    _currentLevel = level;
    resetLevel();
    notifyListeners();
  }

  void startDrawing(Offset point) {
    if (_levelComplete || _levelFailed) return;
    _isDrawing = true;
    _drawnPath = [point];
    notifyListeners();
  }

  void addPoint(Offset point) {
    if (!_isDrawing) return;
    _drawnPath.add(point);
    notifyListeners();
  }

  void endDrawing() {
    _isDrawing = false;
    notifyListeners();
  }

  void markLevelComplete({required bool isPerfect}) {
    _levelComplete = true;
    _showPerfectBadge = isPerfect;
    notifyListeners();
  }

  void markLevelFailed() {
    _levelFailed = true;
    _isDrawing = false;
    notifyListeners();
  }

  void resetLevel() {
    _drawnPath = [];
    _isDrawing = false;
    _levelComplete = false;
    _levelFailed = false;
    _showPerfectBadge = false;
    notifyListeners();
  }

  void nextLevel() {
    _currentLevel++;
    resetLevel();
    notifyListeners();
  }

  void retryLevel() {
    resetLevel();
    notifyListeners();
  }

  int dotsConnected(List<Offset> levelDots) {
    if (_drawnPath.isEmpty) return 0;
    const double tolerance = 25;
    Set<int> connectedDots = {};

    for (var dot in levelDots) {
      for (var point in _drawnPath) {
        final distance = (point - dot).distance;
        if (distance <= tolerance) {
          connectedDots.add(levelDots.indexOf(dot));
          break;
        }
      }
    }

    return connectedDots.length;
  }
}
