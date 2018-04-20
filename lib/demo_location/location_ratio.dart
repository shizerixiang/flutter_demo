import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SizedBox'),
      ),
      body: new SizedBox(
        width: 250.0,
        height: 250.0,
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlueAccent[100],
          ),
        ),
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AspectRatio'),
      ),
      body: new AspectRatio(
        aspectRatio: 3.0 / 2.0,
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlueAccent[100],
          ),
        ),
      ),
    );
  }
}
