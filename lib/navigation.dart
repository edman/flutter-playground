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
    return FirstScreen();
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("First screen"),
        RaisedButton(
          child: Text("Go to second screen"),
          onPressed: () => _goToSecondScreen(context),
        ),
      ],
    );
  }

  _goToSecondScreen(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SecondScreen()));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Second screen"),
        RaisedButton(
          child: Text("Go to third screen"),
          onPressed: () => _goToThirdScreen(context),
        ),
      ],
    );
  }

  _goToThirdScreen(context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => ThirdScreen()));
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Third screen"),
        RaisedButton(
          child: Text("Go to first screen"),
          onPressed: () => _goToFirstScreen(context),
        ),
      ],
    );
  }

  _goToFirstScreen(context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => FirstScreen()), (_) => false);
//        MaterialPageRoute(builder: (context) => FirstScreen()));
  }
}
