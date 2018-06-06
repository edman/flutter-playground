import 'package:flutter/cupertino.dart';
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
    return new Material(
        child: new Container(
      color: Colors.white,
      child: new CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: new Text("Top Books"),
            backgroundColor: Colors.transparent,
//            border: null,
          ),
//          Text("Bla"),
//          Text("Bla"),
//          Text("Bla"),
        ],
      ),
    ));
  }
}
