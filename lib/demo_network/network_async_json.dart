import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

///
/// 网络上加载并解析 JSON 资源
///
void _networkLoading() {
  // 将给定标头的 HTTP GET 请求发送到给定的 URL，并注册回调，参数为 HTTP 响应
  http
      .get('https://domokit.github.io/examples/stocks/data/stock_data_2.json')
      .then((http.Response response) {
    // 响应的主体作为字符串返回
    String netData = response.body;
    // JsonDecoder 类解析 JSON 字符串并构建相应的对象
    JsonDecoder decoder = new JsonDecoder();
    // 将给定的 JSON 字符串输入转换为其对应的对象
    List<List<String>> json = decoder.convert(netData);
    print(json[0][1]); // 输出给定的 JSON 数据
  });
}

///
/// 本地加载并解析 JSON 资源
///
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

void _loadJson() {
  loadAsset().then((value) {
    JsonDecoder decoder = new JsonDecoder();
    List<List<String>> json = decoder.convert(value);
    print(json[0][0]);
  });
}

class JsonDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('JsonDemo'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("load"),
          onPressed: _loadJson,
        ),
      ),
    );
  }
}