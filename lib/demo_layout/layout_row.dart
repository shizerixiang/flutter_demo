import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('LayoutRow'),
      ),
      body: new Row(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('Click of RedButton!');
            },
            color: const Color(0xffcc0000),
            child: new Text('RButton'),
          ),
          new Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: new RaisedButton(
              onPressed: () {
                print('Click of YellowButton!');
              },
              color: const Color(0xfff1c232),
              child: new Text('YButton'),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              print('Click of PinkButton!');
            },
            color: const Color(0xffea9999),
            child: new Text('PButton'),
          ),
        ],
      ),
    );
  }
}
