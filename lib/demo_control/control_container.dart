import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        width: 128.0,
        height: 128.0,
        decoration: new BoxDecoration(
          color: Colors.deepOrange[400],
        ),
      ),
    );
  }
}

class ContainerDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        width: 300.0,
        height: 400.0,
        decoration: new BoxDecoration(
          color: const Color(0xfffce5cd),
          border: new Border.all(
            color: const Color(0xff6d9eeb),
            width: 8.0,
          ),
        ),
        child: new Text('Container Demo'),
      ),
    );
  }
}
