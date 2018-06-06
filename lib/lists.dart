import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TopComponent extends StatefulWidget {
  TopComponent({Key key}) : super(key: key);

  @override
  _TopComponentState createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent> {
  @override
  Widget build(BuildContext context) {
    final filled = List.filled(5, 'a');
    final generate = List.generate(5, (index) => 'a');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("List.filled(5, 'a') => $filled"),
          Text("List.generate(5, (index) => 'a') => $generate"),
        ],
      ),
    );
  }
}
