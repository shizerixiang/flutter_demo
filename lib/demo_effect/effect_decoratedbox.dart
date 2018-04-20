import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DecoratedBox'),
      ),
      body: new Center(
        child: new DecoratedBox(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                colors: <Color>[
                  const Color(0x0ffff2cc),
                  const Color(0xffff6eb4),
                ]),
          ),
          child: new Container(
            width: 250.0,
            height: 250.0,
          ),
        ),
      ),
    );
  }
}
