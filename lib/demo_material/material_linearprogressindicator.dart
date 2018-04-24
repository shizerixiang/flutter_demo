import 'package:flutter/material.dart';

class _ActionViewEcology extends StatelessWidget {
  int maximumEnergy;
  int maximumHunger;
  int maximumMood;
  int currentEnergy;
  int currentHunger;
  int currentMood;

  _ActionViewEcology({
    this.maximumEnergy,
    this.maximumHunger,
    this.maximumMood,
    this.currentEnergy,
    this.currentHunger,
    this.currentMood,
  });

  /// 进度条描述文本
  Align _getNameText(BuildContext context, String text) {
    return new Align(
      alignment: FractionalOffset.topLeft,
      child: new Text(
        text,
        style: new TextStyle(
          fontSize: 15.0,
          color: Colors.black,
          height: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 10.0),
      child: new Column(
        children: <Widget>[
          _getNameText(context, '能量($currentEnergy/$maximumEnergy)'),
          new LinearProgressIndicator(value: currentEnergy / maximumEnergy),
          _getNameText(context, '饥饿($currentHunger/$maximumHunger)'),
          new LinearProgressIndicator(value: currentHunger / maximumHunger),
          _getNameText(context, '心情($currentMood/$maximumMood)'),
          new LinearProgressIndicator(value: currentMood / maximumMood),
        ],
      ),
    );
  }
}

class ProgressDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ProgressDemo'),
      ),
      body: new _ActionViewEcology(
        maximumEnergy: 100,
        currentEnergy: 50,
        maximumHunger: 100,
        currentHunger: 20,
        maximumMood: 100,
        currentMood: 80,
      ),
    );
  }
}
