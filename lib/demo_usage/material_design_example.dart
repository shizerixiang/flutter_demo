import 'package:flutter/material.dart';

class MaterialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Nav Menu',
          onPressed: null,
        ),
        title: new Text('Example Title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: new Center(
        child: new Text('Hellow World!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
