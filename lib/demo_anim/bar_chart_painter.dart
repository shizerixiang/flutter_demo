import 'package:flutter/material.dart';

/// 自定义矩形条绘图器
@Deprecated("Please use bar.dart")
class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0; // 矩形条宽度
  final double barHeight; // 矩形条高度

  BarChartPainter(this.barHeight);

  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
    // 绘制矩形
    canvas.drawRect(
        new Rect.fromLTWH(
          (size.width - barWidth) / 2.0,
          size.height - barHeight,
          barWidth,
          barHeight,
        ),
        paint);
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) =>
      barHeight != oldDelegate.barHeight; // 是否重绘
}
