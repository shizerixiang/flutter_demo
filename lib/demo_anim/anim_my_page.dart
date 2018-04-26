import 'package:flutter/material.dart';
import 'dart:math';

import 'bar.dart';

/// APP 入口
class MyPageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterAnimDemo',
      home: new MyHomePage(),
    );
  }
}

/// 主页面
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyHomePageState();
}

/// 主页面状态
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // 随机数生成器
  final random = new Random();
  int dataSet = 50;
  AnimationController animation;
  BarChartTween tween;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = new BarChartTween(new BarChart.empty(), new BarChart.random(random));
    // 正序播放动画
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  /// 变换数据
  void changeData() {
    setState(() {
      tween = new BarChartTween(
        tween.evaluate(animation),
        new BarChart.random(random),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: new Size(200.0, 100.0),
          painter: new BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}
