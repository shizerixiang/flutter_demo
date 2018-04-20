import 'package:flutter/material.dart';

// 导航图标视图
class NavigationIconView {
  final Widget _icon; // 存储图标
  final Color _color; // 存储颜色
  final BottomNavigationBarItem item; // 底部导航栏项目
  final AnimationController controller; // 动画控制器
  CurvedAnimation _animation; // 曲线动画

  // 导航图标视图的构造函数
  NavigationIconView({
    // 图标
    Widget icon,
    // 标题
    Widget title,
    // 控件颜色
    Color color,

    ///
    /// Ticker 提供者
    /// 由类实现的接口，可以提供 Ticker 对象
    /// Ticker 对象：每个动画帧调用一次
    ///
    TickerProvider vsync,
  })  :
        // 接收传递的图标
        _icon = icon,
        // 接收传递的颜色
        _color = color,
        // 创建底部导航栏项目
        item = new BottomNavigationBarItem(
          // 项目的图标
          icon: icon,
          // 项目的标题
          title: title,
        ),
        // 创建动画控制器
        controller = new AnimationController(
          // 动画持续的时间长度：默认情况下主题更改动画的持续时间
          duration: kThemeAnimationDuration,
          // 垂直同步
          vsync: vsync,
        ) {
    // 创建曲线动画
    _animation = new CurvedAnimation(
      // 应用曲线动画
      parent: controller,

      ///
      /// 正向使用的曲线：
      /// 从 0.5
      /// 到 1.0 结束
      /// 应用的曲线：快速启动并缓和到最终位置的曲线
      ///
      curve: new Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  ///
  /// 类函数，过渡转换
  /// type 定义底部导航栏的布局和行为
  /// context 处理控件树中的控件
  ///
  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    // 局部变量，存储图标颜色
    Color iconColor;
    // 如果底部导航栏的位置和大小在点击时会变大
    if (type == BottomNavigationBarType.shifting) {
      // 存储颜色作为图标颜色
      iconColor = _color;
    } else {
      ///
      /// 保存质感设计主题的颜色和排版值：
      /// 使用 ThemeData 来配置主题控件
      /// 使用 Theme.of 获取当前主题
      ///
      final ThemeData themeData = Theme.of(context);

      ///
      /// 如果程序整体主题的亮度很高（需要深色文本颜色才能实现可读的对比度）
      /// 就返回程序主要部分的背景颜色作为图标颜色
      /// 否则返回控件的前景颜色作为图标颜色
      ///
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }
    // 创建不透明度转换
    return new FadeTransition(
      // 控制子控件不透明度的动画
      opacity: _animation,
      // 创建滑动转换过渡
      child: new SlideTransition(
        ///
        /// 控制子控件位置的动画
        /// 开始值和结束值之间的线性插值<以尺寸的分数表示的偏移量>
        ///
        position: new Tween<Offset>(
          // 动画的起始值
          begin: const Offset(0.0, 0.02),
          // 动画的结尾值
          end: Offset(0.0, 0.0),
        ).animate(_animation),
        child: new IconTheme(
          // 用于子控件中图标的颜色，不透明度和大小
          data: new IconThemeData(
            // 图标的默认颜色
            color: iconColor,
            // 图标的默认大小
            size: 120.0,
          ),
          // 子控件
          child: _icon,
        ),
      ),
    );
  }
}
