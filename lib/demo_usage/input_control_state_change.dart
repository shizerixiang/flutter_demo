import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Example flutter!'),
      ),
      body: new Center(
        child: new Text(
          'Click times：$_count',
          style: new TextStyle(fontSize: 24.0),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _increment,
        tooltip: 'add',
        child: new Icon(Icons.add),
      ),
    );
  }
}
