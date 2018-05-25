import 'package:flutter/material.dart';
import 'tutorial_fling.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Playground',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        appBar: new AppBar(
          title: new Text('Playground'),
        ),
        body: TopComponent(),
      ),
    );
  }
}
