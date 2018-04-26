import 'package:flutter/material.dart';
import 'dart:math';

class ColorPalette {
  static final ColorPalette primary = new ColorPalette(<Color>[
    Colors.blue[400],
    Colors.red[400],
    Colors.green[400],
    Colors.yellow[400],
    Colors.purple[400],
    Colors.orange[400],
    Colors.teal[400],
  ]);
  final List<Color> _colors;

  ColorPalette(List<Color> colors) : _colors = colors {
    assert(colors.isNotEmpty);
  }

  int get length => _colors.length;

  Color operator [](int index) => _colors[index % length];

  /// 随机生成颜色
  Color random(Random random) => this[random.nextInt(length)];
}
