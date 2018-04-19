import 'package:flutter/material.dart';

//import 'package:flutter_demo/demo/auto_home_page.dart';
//// Android Studio 自动生成案例
//void main() => runApp(new MyApp());

//import 'package:flutter_demo/demo/hello_world.dart';
//// 自己编写的 Hello World
//void main() => runApp(new MaterialApp(
//      title: 'My application',
//      home: new MyBodyWidget(),
//    ));

//import 'package:flutter_demo/demo/material_design_example.dart';
//// 使用质感设计的第一个界面
//void main() => runApp(new MaterialApp(
//  title: 'My application',
//  home: new MaterialHome(),
//));

//import 'package:flutter_demo/demo/gesture_handle.dart';
//// 手势处理
//void main() => runApp(new MaterialApp(
//      title: '手势处理',
//      home: new MyButton(),
//    ));

//import 'package:flutter_demo/demo/input_control_state_change.dart';
//// 根据用户输入改变控件
//void main() => runApp(new MaterialApp(
//      title: '根据用户输入改变控件',
//      home: new Counter(),
//    ));

import 'package:flutter_demo/demo/shopping/shopping_list.dart';
// 购物车小示例
void main() => runApp(new MaterialApp(
      title: '购物车小示例',
      home: new ShoppingList(products: kProducts),
    ));
