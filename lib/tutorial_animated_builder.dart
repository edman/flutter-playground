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
  Animation<double> sizeAnimation, opacityAnimation;
  Animation<double> curved;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    print('.. initstate');
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    curved = CurvedAnimation(parent: controller.view, curve: Curves.easeOut);
    // Tween is an [Animatable], call animate on it giving a driver [Animation],
    // and it will return an [Animation].
    sizeAnimation = Tween(begin: 0.0, end: 300.0).animate(curved);
    opacityAnimation = Tween(begin: 0.1, end: 1.0).animate(controller.view);

    // Add 'breathing' effect, drive controller from forward to reverse.
    sizeAnimation.addStatusListener((state) {
      print('.. state=$state');
      if (state == AnimationStatus.dismissed)
        controller.forward();
      else if (state == AnimationStatus.completed) controller.reverse();
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GrowTransition(
        animation: sizeAnimation,
        child: LogoWidget(),
        //  The code below works but for some reason it triggers lots of builds.
//        child: OpacityTransition(
//          animation: opacityAnimation,
//          child: LogoWidget(),
//        ),
      ),
    );
  }
}

class OpacityTransition extends StatelessWidget {
  OpacityTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    print('.. build OpacityTransition');
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (BuildContext context, Widget child) {
        print('.. build builder opacity');
        return Opacity(
          opacity: animation.value,
          child: child,
        );
      },
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    print('.. build GrowTransition');
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (BuildContext context, Widget child) {
        print('.. build builder grow');
        return Container(
          // Container of size [animation] forces child to shrink/expand.
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('.. build LogoWidget');
    return Container(
      // No height nor width, let it fill the available space (which the parent
      // will animate)
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}
