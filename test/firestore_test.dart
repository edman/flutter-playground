// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'dart:async';

import 'package:test/test.dart';

void main() {
  test('Counter increments smoke test', () async {
    final bla = () async { return Future(() { return 10; } ); };
    final r = bla();
    print("r type=${r.runtimeType} value=$r");
    final a = await r;
    print("a type=${a.runtimeType} value=$a");
  });
}
