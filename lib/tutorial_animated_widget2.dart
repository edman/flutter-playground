import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// As seen on https://flutter.io/tutorials/animation/
class TopComponent extends StatefulWidget {
  @override
  _TopComponentState createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent>
    with SingleTickerProviderStateMixin {
  Animation<double> curved;
  AnimationController controller;

  final _sizeAnimation = Tween(begin: 0.0, end: 300.0);
  final _opacityAnimation = Tween(begin: 0.1, end: 1.0);

  @override
  void initState() {
    super.initState();
    print('.. initstate');
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Tween is an [Animatable], call animate on it giving a driver [Animation],
    // and it will return an [Animation].
    curved = CurvedAnimation(parent: controller.view, curve: Curves.easeInOut);

    curved.addStatusListener((state) {
      print('.. state=$state');
      if (state == AnimationStatus.dismissed)
        controller.forward();
      else if (state == AnimationStatus.completed) controller.reverse();
    });

    print('.. initstate forward');
    controller.forward();
//    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('.. build');
    return Center(
      // This thing has the same problem as in tutorial_animated_builder, where
      // lots of builds get triggered.
      child: GrowTransition(
        animation: _sizeAnimation.animate(curved),
        child: OpacityTransition(
          animation: _opacityAnimation.animate(curved),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class GrowTransition extends AnimatedWidget {
  GrowTransition({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation);

  Animation<double> get animation => listenable;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    print('.. build GrowTransition');
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: animation.value,
      width: animation.value,
      child: child,
    );
  }
}

class OpacityTransition extends AnimatedWidget {
  OpacityTransition({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation);

  Animation<double> get animation => listenable;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    print('.. build OpacityTransition');
    return Opacity(
      opacity: animation.value,
      child: child,
    );
  }
}
