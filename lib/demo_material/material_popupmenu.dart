import 'package:flutter/material.dart';

class PopupMenuDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenuDemo>{
  String _bodyStr = '显示菜单的点击';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PopupMenuDemo'),
        actions: <Widget>[
          new PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _bodyStr = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              new PopupMenuItem(
                value: '选项一的值',
                child: new Text('选项一'),
              ),
              new PopupMenuItem(
                value: '选项二的值',
                child: new Text('选项二'),
              ),
            ],
          )
        ],
      ),
      body: new Center(
        child: new Text(_bodyStr),
      ),
    );
  }
}
