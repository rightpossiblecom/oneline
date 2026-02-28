import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentLevel = 1;

  int get currentLevel => _currentLevel;

  void setCurrentLevel(int level) {
    _currentLevel = level;
    notifyListeners();
  }

  void startNewGame() {
    _currentLevel = 1;
    notifyListeners();
  }

  void continueGame() {
    // Load the saved level
    notifyListeners();
  }
}
