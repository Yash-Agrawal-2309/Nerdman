import 'package:flutter/material.dart';

import 'Screen/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Create a new dart file in [Screens] folder and name it
      /// game.dart
      home: Homepage(),
    );
  }
}
