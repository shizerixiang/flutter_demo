import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton is clicked!');
      },
      onDoubleTap: () {
        print('Double tap the MyButton!');
      },
      onLongPress: () {
        print('Press the MyButton!');
      },
      onHorizontalDragDown: (DragStartDetails) {
        print(
            'Horizontal drag down the MyButton! DragStartDetails=$DragStartDetails');
      },
      onHorizontalDragStart: (DragStartDetails) {
        print(
            'Horizontal drag start the MyButton! DragStartDetails=$DragStartDetails');
      },
      onHorizontalDragUpdate: (DragStartDetails) {
        print(
            'Horizontal drag update the MyButton! DragStartDetails=$DragStartDetails');
      },
      onHorizontalDragEnd: (DragStartDetails) {
        print(
            'Horizontal drag end the MyButton! DragStartDetails=$DragStartDetails');
      },
      onHorizontalDragCancel: () {
        print('Horizontal drag cancle the MyButton!');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text("I'm MyButton"),
        ),
      ),
    );
  }
}
