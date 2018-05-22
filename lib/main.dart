import 'package:flutter/material.dart';
import 'cached_network_image_file_location.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Playground',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Playground'),
        ),
        body: TopComponent(),
      ),
    );
  }
}

