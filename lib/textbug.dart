import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyWidget()
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _controller = TextEditingController();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_print);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 80.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _controller,
            ),
          ),
          const SizedBox(height: 80.0),
          Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: _append,
                child: Text('Append')
              ),
            ],
          )
        ],
      ),
    );
  }

  _print() {
    print("Current value: ${_controller.text}");
    print("Current Cursor Position: ${_controller.selection.start}");
  }

  _append() {
    int currentPosition = _controller.selection.start;
    String appendedText = (++_counter).toString() + " ";
    _controller.text += appendedText;
    int newPosition = currentPosition + appendedText.length;
    _controller.selection = TextSelection(baseOffset: newPosition, extentOffset: newPosition);
  }
}
