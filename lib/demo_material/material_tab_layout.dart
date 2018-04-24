import 'package:flutter/material.dart';

/// 标签演示样式
enum TabsDemoStyle { iconsAndText, iconsOnly, textOnly }

/// 标签页面
class _Page {
  final IconData icon;
  final String text;

  _Page({
    this.icon,
    this.text,
  });
}

/// 页面列表
final List<_Page> _allPages = <_Page>[
  new _Page(icon: Icons.event, text: 'EVENT'),
  new _Page(icon: Icons.home, text: 'HOME'),
  new _Page(icon: Icons.android, text: 'ANDROID'),
  new _Page(icon: Icons.alarm, text: 'ALARM'),
  new _Page(icon: Icons.face, text: 'FACE'),
  new _Page(icon: Icons.language, text: 'LANGUAGE'),
];

/// 滑动顶部 Tab 栏
class ScrollableTabsDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ScrollableTabsDemoState();
}

/// 滑动顶部 Tab 栏状态
class _ScrollableTabsDemoState extends State<ScrollableTabsDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller; // Tab 控制器
  TabsDemoStyle _demoStyle = TabsDemoStyle.iconsAndText; // 默认显示样式

  @override
  void initState() {
    super.initState();
    // 管理状态
    _controller = new TabController(length: _allPages.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void changeDemoStyle(TabsDemoStyle style) {
    setState(() {
      _demoStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).accentColor; // 主题色
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滚动标签栏'),
        actions: <Widget>[
          new PopupMenuButton<TabsDemoStyle>(
            onSelected: changeDemoStyle,
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<TabsDemoStyle>>[
                  new PopupMenuItem(
                    child: new Text('图标和文本'),
                    value: TabsDemoStyle.iconsAndText,
                  ),
                  new PopupMenuItem(
                    child: new Text('仅图标'),
                    value: TabsDemoStyle.iconsOnly,
                  ),
                  new PopupMenuItem(
                    child: new Text('仅文本'),
                    value: TabsDemoStyle.textOnly,
                  ),
                ],
          ),
        ],
        bottom: new TabBar(
          controller: _controller, // 控件的选择和动画状态
          isScrollable: true, // 是否可滑动
          tabs: _allPages.map((_Page page) {
            // 控件列表
            switch (_demoStyle) {
              case TabsDemoStyle.iconsAndText:
                return new Tab(text: page.text, icon: new Icon(page.icon));
              case TabsDemoStyle.iconsOnly:
                return new Tab(icon: new Icon(page.icon));
              case TabsDemoStyle.textOnly:
                return new Tab(text: page.text);
            }
          }).toList(),
        ),
      ),
      body: new TabBarView(
          controller: _controller,
          children: _allPages.map((_Page page) {
            return new Container(
              key: new ObjectKey(page.icon),
              padding: const EdgeInsets.all(12.0),
              child: new Card(
                child: new Center(
                  child: new Icon(
                    page.icon,
                    color: iconColor,
                    size: 128.0,
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
