import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class TopComponent extends StatefulWidget {

  TopComponent({Key key}) : super(key: key);

  @override
  _TopComponentState createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent>
    with SingleTickerProviderStateMixin {
  Animation<double> curved;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    print('.. initstate');
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Tween is an [Animatable], call animate on it giving a driver [Animation],
    // and it will return an [Animation]
    curved = CurvedAnimation(parent: controller.view, curve: Curves.easeInOut);

    curved.addStatusListener((state) {
      print('.. state=$state');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double get _height {
    final RenderBox renderBox = _backdropKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  _onVerticalDragUpdate(BuildContext context, DragUpdateDetails drag) {
    final height = context.size.height;
    print('.. drag update height=$height drag=$drag');
    controller.animateTo(
      controller.value + drag.delta.dy / height,
      duration: Duration(milliseconds: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('.. build');
    return Center(
      child: new Column(
        children: <Widget>[
          Expanded(
            child: AnimatedLogo(
              animation: curved,
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                  decoration: BoxDecoration(color: Colors.deepOrange)),
              onVerticalDragEnd: (DragEndDetails drag) {
                print('.. drag end drag=$drag');
//                controller.fling(velocity: drag.primaryVelocity / 1000);
                controller.fling(velocity: 0.0);
              },
              onVerticalDragUpdate: (DragUpdateDetails drag) =>
                  _onVerticalDragUpdate(context, drag),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Animation<double> get animation => listenable;

  final _sizeAnimation = Tween(begin: 0.0, end: 200.0);
  final _opacityAnimation = Tween(begin: 0.1, end: 1.0);

  @override
  Widget build(BuildContext context) {
    print('.. build logo');
    return Opacity(
      opacity: _opacityAnimation.evaluate(animation),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: _sizeAnimation.evaluate(animation),
        width: _sizeAnimation.evaluate(animation),
        child: FlutterLogo(),
      ),
    );
  }
}
