import 'package:flutter/material.dart';

// 导航图标视图
class NavigationIconView {
  final Widget _icon; // 存储图标
  final Color _color; // 存储颜色
  final BottomNavigationBarItem item; // 底部导航栏项目
  final AnimationController controller; // 动画控制器
  CurvedAnimation _animation; // 曲线动画 —— 类似于插值器

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
          begin: const Offset(0.0, 0.1),
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

///
/// 自定义图标
/// StatelessWidget 无状态控件
///
class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取当前图标主题，创建与此图标主题相同的图标主题
    final IconThemeData iconTheme = IconTheme.of(context);
    // 返回一个容器控件
    return new Container(
      // 围绕子控件的填充
      margin: const EdgeInsets.all(4.0),
      // 容器宽度
      width: iconTheme.size - 8.0,
      // 容器高度
      height: iconTheme.size - 8.0,
      // 创建装饰
      decoration: new BoxDecoration(
        // 背景色
        color: iconTheme.color,
      ),
    );
  }
}

///
/// 菜单演示
/// StatefulWidget 有状态控件
///
class MenusDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenusDemoState();
}

///
/// 关联 State 子类的实例
/// 实现菜单演示的状态
/// 提供 TickerProvider 对象
///
class _MenusDemoState extends State<MenusDemo> with TickerProviderStateMixin {
  // 当前选中的底部导航栏项
  int _currentIndex = 2;

  // 存储导航栏的布局和行为：点击时变大
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;

  // 导航栏项集合
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    /// 在对象插入到树中调用，框架将它创建的每个 State 对象调用一次
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.access_alarm),
        title: new Text('成就'),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new CustomIcon(),
        title: new Text('行动'),
        color: Colors.deepOrange[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.cloud),
        title: new Text('人物'),
        color: Colors.teal[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.favorite),
        title: new Text('财产'),
        color: Colors.indigo[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.event_available),
        title: new Text('设置'),
        color: Colors.pink[500],
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews)
      // 每次动画控制器的值更改时调用侦听器
      view.controller.addListener(_rebuild);
    // 底部导航栏当前选择的动画控制器为 1.0
    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    /// 释放对象使用的资源
    super.dispose();
    for (NavigationIconView view in _navigationViews)
      view.controller.dispose(); // 调用此方法后对象不再可用
  }

  void _rebuild() {
    // 通知框架此对象的内部状态已更改
    setState(() {
      // 为视图创建动画，播放动画的每一帧都会调用重绘
    });
  }

  ///
  /// 建立过渡堆栈
  ///
  Widget _buildTransitionsStack() {
    // 存储不透明度转换列表
    final List<FadeTransition> transitions = <FadeTransition>[];
    // 循环调用存储 NavigationIconView 类的列表的值
    for (NavigationIconView view in _navigationViews)
      // 在存储不透明度转换的列表中添加 transition 函数的返回值
      transitions.add(view.transition(_type, context));
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      double aValue = aAnimation.value;
      double bValue = bAnimation.value;

      ///
      /// 将 aValue 与 bValue 进行比较
      /// 返回一个负整数，aValue 排序在 bValue 之前
      /// 返回一个正整数，aValue 排序在 bValue 之后
      ///
      return aValue.compareTo(bValue);
    });
    // 创建层叠布局控件
    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar btnNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navIconView) => navIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      // 设置底部导航栏，每个 item 的点击事件
      onTap: (int index) {
        setState(() {
          // reverse() 倒退动画，即恢复动画之前的状态，从 end 开始到 begin 结束
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          // forward() 正常动画，即播放设置的动画，从 begin 开始到 end 结束
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('底部导航演示'),
        actions: <Widget>[
          new PopupMenuButton<BottomNavigationBarType>(
            onSelected: (BottomNavigationBarType v) {
              setState(() {
                _type = v;
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<BottomNavigationBarType>>[
                  new PopupMenuItem<BottomNavigationBarType>(
                    value: BottomNavigationBarType.fixed,
                    child: new Text('Fixed'),
                  ),
                  new PopupMenuItem<BottomNavigationBarType>(
                    value: BottomNavigationBarType.shifting,
                    child: new Text('Shifting'),
                  )
                ],
          ),
        ],
      ),
      body: new Center(
        child: _buildTransitionsStack(),
//        child: new Text('你好'),
      ),
      bottomNavigationBar: btnNavBar,
    );
  }
}
