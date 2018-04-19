import 'package:flutter/material.dart';

class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('LocationCenter'),
      ),
      body: new Center(
        child: new Text("I'm in the middle of the screen!"),
      ),
    );
  }
}
