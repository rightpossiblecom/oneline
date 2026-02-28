import 'package:flutter/material.dart';
import 'dart:math' as math;

class GameLevel {
  final int levelNumber;
  final List<Offset> dots;
  final String description;

  GameLevel({
    required this.levelNumber,
    required this.dots,
    this.description = '',
  });

  bool isValid() {
    return dots.length >= 2;
  }
}

class GameService {
  static final GameService _instance = GameService._internal();

  GameService._internal();

  factory GameService() {
    return _instance;
  }

  List<GameLevel> getAllLevels() {
    return _generateLevels();
  }

  GameLevel getLevel(int levelNumber) {
    final levels = getAllLevels();
    if (levelNumber > 0 && levelNumber <= levels.length) {
      return levels[levelNumber - 1];
    }
    return levels[0];
  }

  bool areDotsConnected(List<Offset> drawnPath, List<Offset> levelDots) {
    if (drawnPath.isEmpty || levelDots.isEmpty) return false;

    const double tolerance = 25;
    Set<int> connectedDots = {};

    for (var dot in levelDots) {
      for (var point in drawnPath) {
        if (_distance(point, dot) <= tolerance) {
          connectedDots.add(levelDots.indexOf(dot));
          break;
        }
      }
    }

    return connectedDots.length == levelDots.length;
  }

  bool isPathClean(List<Offset> drawnPath, List<Offset> levelDots) {
    // Simple check: path shouldn't have excessive crossing
    // Count how many times the path crosses itself
    int crossings = 0;

    for (int i = 0; i < drawnPath.length - 1; i++) {
      for (int j = i + 4; j < drawnPath.length - 1; j++) {
        if (_doSegmentsIntersect(
          drawnPath[i],
          drawnPath[i + 1],
          drawnPath[j],
          drawnPath[j + 1],
        )) {
          crossings++;
        }
      }
    }

    return crossings == 0;
  }

  double _distance(Offset p1, Offset p2) {
    return math.sqrt(math.pow(p1.dx - p2.dx, 2) + math.pow(p1.dy - p2.dy, 2));
  }

  bool _doSegmentsIntersect(Offset p1, Offset p2, Offset p3, Offset p4) {
    ccw(c, a, b) {
      return (b.dy - a.dy) * (c.dx - a.dx) > (b.dx - a.dx) * (c.dy - a.dy);
    }

    return ccw(p1, p3, p4) != ccw(p2, p3, p4) &&
        ccw(p1, p2, p3) != ccw(p1, p2, p4);
  }

  List<GameLevel> _generateLevels() {
    return [
      // Level 1: Simple horizontal line
      GameLevel(
        levelNumber: 1,
        dots: [
          const Offset(100, 200),
          const Offset(200, 200),
          const Offset(300, 200),
        ],
        description: 'Connect the dots in a line',
      ),

      // Level 2: Simple vertical line
      GameLevel(
        levelNumber: 2,
        dots: [
          const Offset(200, 100),
          const Offset(200, 200),
          const Offset(200, 300),
        ],
        description: 'Draw vertically',
      ),

      // Level 3: Simple triangle
      GameLevel(
        levelNumber: 3,
        dots: [
          const Offset(200, 100),
          const Offset(100, 300),
          const Offset(300, 300),
        ],
        description: 'Form a triangle',
      ),

      // Level 4: Square
      GameLevel(
        levelNumber: 4,
        dots: [
          const Offset(100, 100),
          const Offset(300, 100),
          const Offset(300, 300),
          const Offset(100, 300),
        ],
        description: 'Draw a square',
      ),

      // Level 5: Diamond
      GameLevel(
        levelNumber: 5,
        dots: [
          const Offset(200, 80),
          const Offset(320, 200),
          const Offset(200, 320),
          const Offset(80, 200),
        ],
        description: 'Create a diamond',
      ),

      // Level 6: Star (5 points)
      GameLevel(
        levelNumber: 6,
        dots: [
          const Offset(200, 50),
          const Offset(283, 175),
          const Offset(415, 175),
          const Offset(320, 255),
          const Offset(360, 380),
          const Offset(200, 310),
          const Offset(40, 380),
          const Offset(80, 255),
          const Offset(-15, 175),
          const Offset(117, 175),
        ],
        description: 'Draw a 5-point star',
      ),

      // Level 7: L-shape
      GameLevel(
        levelNumber: 7,
        dots: [
          const Offset(100, 100),
          const Offset(100, 300),
          const Offset(300, 300),
        ],
        description: 'Form an L shape',
      ),

      // Level 8: Z-shape
      GameLevel(
        levelNumber: 8,
        dots: [
          const Offset(100, 100),
          const Offset(300, 100),
          const Offset(100, 300),
          const Offset(300, 300),
        ],
        description: 'Draw a Z pattern',
      ),

      // Level 9: Pentagon
      GameLevel(
        levelNumber: 9,
        dots: [
          const Offset(200, 80),
          const Offset(310, 130),
          const Offset(270, 250),
          const Offset(130, 250),
          const Offset(90, 130),
        ],
        description: 'Complete a pentagon',
      ),

      // Level 10: Hexagon
      GameLevel(
        levelNumber: 10,
        dots: [
          const Offset(200, 80),
          const Offset(310, 130),
          const Offset(340, 250),
          const Offset(200, 320),
          const Offset(60, 250),
          const Offset(90, 130),
        ],
        description: 'Draw a hexagon',
      ),

      // Level 11: Spiral start
      GameLevel(
        levelNumber: 11,
        dots: [
          const Offset(200, 100),
          const Offset(250, 100),
          const Offset(250, 150),
          const Offset(200, 150),
          const Offset(200, 200),
        ],
        description: 'Follow a spiral',
      ),

      // Level 12: Cross
      GameLevel(
        levelNumber: 12,
        dots: [
          const Offset(200, 100),
          const Offset(200, 200),
          const Offset(200, 300),
          const Offset(100, 200),
          const Offset(300, 200),
        ],
        description: 'Form a plus sign',
      ),

      // Level 13: Two triangles
      GameLevel(
        levelNumber: 13,
        dots: [
          const Offset(150, 100),
          const Offset(100, 200),
          const Offset(200, 200),
          const Offset(250, 100),
          const Offset(300, 200),
        ],
        description: 'Connect two triangles',
      ),

      // Level 14: Rectangle
      GameLevel(
        levelNumber: 14,
        dots: [
          const Offset(80, 120),
          const Offset(320, 120),
          const Offset(320, 280),
          const Offset(80, 280),
        ],
        description: 'Draw a rectangle',
      ),

      // Level 15: Wave pattern
      GameLevel(
        levelNumber: 15,
        dots: [
          const Offset(50, 150),
          const Offset(100, 100),
          const Offset(150, 150),
          const Offset(200, 100),
          const Offset(250, 150),
          const Offset(300, 100),
          const Offset(350, 150),
        ],
        description: 'Create a wave',
      ),

      // Level 16: Grid (simple 3x3)
      GameLevel(
        levelNumber: 16,
        dots: [
          const Offset(100, 100),
          const Offset(200, 100),
          const Offset(300, 100),
          const Offset(100, 200),
          const Offset(200, 200),
          const Offset(300, 200),
          const Offset(100, 300),
          const Offset(200, 300),
          const Offset(300, 300),
        ],
        description: 'Connect a 3x3 grid',
      ),

      // Level 17: Octagon
      GameLevel(
        levelNumber: 17,
        dots: [
          const Offset(150, 50),
          const Offset(250, 50),
          const Offset(320, 120),
          const Offset(320, 220),
          const Offset(250, 290),
          const Offset(150, 290),
          const Offset(80, 220),
          const Offset(80, 120),
        ],
        description: 'Build an octagon',
      ),

      // Level 18: Hourglass shape
      GameLevel(
        levelNumber: 18,
        dots: [
          const Offset(80, 80),
          const Offset(320, 80),
          const Offset(200, 200),
          const Offset(80, 320),
          const Offset(320, 320),
        ],
        description: 'Form an hourglass',
      ),

      // Level 19: Bowtie
      GameLevel(
        levelNumber: 19,
        dots: [
          const Offset(100, 100),
          const Offset(300, 100),
          const Offset(200, 200),
          const Offset(100, 300),
          const Offset(300, 300),
        ],
        description: 'Draw a bowtie',
      ),

      // Level 20: Spiral (more complex)
      GameLevel(
        levelNumber: 20,
        dots: [
          const Offset(200, 100),
          const Offset(280, 120),
          const Offset(300, 200),
          const Offset(280, 280),
          const Offset(200, 300),
          const Offset(120, 280),
          const Offset(100, 200),
          const Offset(120, 120),
        ],
        description: 'Trace the spiral',
      ),

      // Level 21: Random complex shape
      GameLevel(
        levelNumber: 21,
        dots: [
          const Offset(200, 80),
          const Offset(280, 100),
          const Offset(300, 180),
          const Offset(260, 260),
          const Offset(180, 280),
          const Offset(100, 260),
          const Offset(60, 180),
          const Offset(80, 100),
          const Offset(140, 120),
          const Offset(180, 140),
        ],
        description: 'Complete the complex path',
      ),

      // Level 22: Plus with extended arms
      GameLevel(
        levelNumber: 22,
        dots: [
          const Offset(200, 50),
          const Offset(200, 150),
          const Offset(200, 250),
          const Offset(200, 350),
          const Offset(50, 200),
          const Offset(150, 200),
          const Offset(250, 200),
          const Offset(350, 200),
        ],
        description: 'Draw an extended plus',
      ),

      // Level 23: Nested squares
      GameLevel(
        levelNumber: 23,
        dots: [
          const Offset(80, 80),
          const Offset(320, 80),
          const Offset(320, 320),
          const Offset(80, 320),
          const Offset(150, 150),
          const Offset(250, 150),
          const Offset(250, 250),
          const Offset(150, 250),
        ],
        description: 'Connect nested squares',
      ),

      // Level 24: Triangle ring
      GameLevel(
        levelNumber: 24,
        dots: [
          const Offset(200, 60),
          const Offset(80, 280),
          const Offset(320, 280),
          const Offset(200, 140),
          const Offset(120, 240),
          const Offset(280, 240),
        ],
        description: 'Link the triangles',
      ),

      // Level 25: Asterisk
      GameLevel(
        levelNumber: 25,
        dots: [
          const Offset(200, 100),
          const Offset(200, 200),
          const Offset(200, 300),
          const Offset(100, 150),
          const Offset(200, 200),
          const Offset(300, 150),
          const Offset(120, 280),
          const Offset(200, 200),
          const Offset(280, 280),
        ],
        description: 'Form an asterisk',
      ),

      // Level 26: Smooth curves (connected dots forming curve illusion)
      GameLevel(
        levelNumber: 26,
        dots: [
          const Offset(100, 150),
          const Offset(120, 120),
          const Offset(150, 100),
          const Offset(180, 95),
          const Offset(210, 100),
          const Offset(240, 120),
          const Offset(260, 150),
        ],
        description: 'Trace the curve',
      ),

      // Level 27: Double helix pattern
      GameLevel(
        levelNumber: 27,
        dots: [
          const Offset(150, 100),
          const Offset(250, 120),
          const Offset(200, 180),
          const Offset(150, 200),
          const Offset(250, 240),
          const Offset(150, 280),
        ],
        description: 'Follow the helix',
      ),

      // Level 28: Pentagon star
      GameLevel(
        levelNumber: 28,
        dots: [
          const Offset(200, 50),
          const Offset(275, 185),
          const Offset(235, 265),
          const Offset(165, 265),
          const Offset(125, 185),
          const Offset(140, 110),
          const Offset(200, 145),
          const Offset(260, 110),
        ],
        description: 'Draw a star inside',
      ),

      // Level 29: Complex maze-like
      GameLevel(
        levelNumber: 29,
        dots: [
          const Offset(100, 100),
          const Offset(300, 100),
          const Offset(300, 150),
          const Offset(150, 150),
          const Offset(150, 200),
          const Offset(300, 200),
          const Offset(300, 250),
          const Offset(100, 250),
          const Offset(100, 300),
          const Offset(300, 300),
        ],
        description: 'Navigate the path',
      ),

      // Level 30: Final challenge - high dot count
      GameLevel(
        levelNumber: 30,
        dots: [
          const Offset(100, 100),
          const Offset(150, 100),
          const Offset(200, 100),
          const Offset(250, 100),
          const Offset(300, 100),
          const Offset(300, 150),
          const Offset(300, 200),
          const Offset(300, 250),
          const Offset(300, 300),
          const Offset(250, 300),
          const Offset(200, 300),
          const Offset(150, 300),
          const Offset(100, 300),
          const Offset(100, 250),
          const Offset(100, 200),
          const Offset(100, 150),
        ],
        description: 'Final challenge',
      ),
    ];
  }
}
