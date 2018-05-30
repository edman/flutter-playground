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
    final list = List.filled(5, "a");
    print(list);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("List.filled(5, 'a') => $list"),
        ],
      ),
    );
  }
}
