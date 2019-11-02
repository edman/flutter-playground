import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// See https://github.com/flutter/flutter/issues/42049

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  @override
  DialogState createState() => DialogState();
}

class DialogState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duff Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async => await openDialog(true),
              child: Text("Cupertino"),
            ),
            RaisedButton(
              onPressed: () async => await openDialog(false),
              child: Text("Material"),
            )
          ],
        ),
      ),
    );
  }

  Future openDialog(bool isCupertino) => showDialog<String>(
        context: context,
        // dialog is dismissible with a tap on the barrier
        // barrierDismissible: false,
        builder: (BuildContext _) =>
            (isCupertino) ? cupertinoDialog() : materialDialog(),
            // (isCupertino) ? cupertinoPlaceholderDialog() : materialDialog(),
      );

  Widget cupertinoPlaceholderDialog() => MediaQuery(
        // data: MediaQueryData(
        //     viewInsets: EdgeInsets.fromLTRB(10.0, 40.0, 20.0, 40.0)),
        data: MediaQueryData(
            viewInsets: EdgeInsets.fromLTRB(0.0, 00.0, 00.0, 00.0)),
        // child: CupertinoAlertDialog(content: Placeholder()),
        child: AlertDialog(content: Placeholder()),
      );

  Widget cupertinoDialog() => CupertinoAlertDialog(
        // content: Placeholder(),
        title: Text("iOS Input"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("Save"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              CupertinoTextField(
                placeholder: "Enter a value.",
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
            ],
          ),
        ),
      );

  Widget materialDialog() => AlertDialog(
        title: Text("Android Input"),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
          FlatButton(
            child: Text('Save'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}
