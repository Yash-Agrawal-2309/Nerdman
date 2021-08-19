import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:nerd_man/Screen/Homepage.dart';

/// create a [Stateless] widget Building
/// which returns a [container] with the
/// child as [image] - "building-3.png" from the [assets]

class Building extends StatelessWidget {
  double calcNewHeight() {
    // logic to change the new height in game
    Random rand = new Random();
    double newHeight = 300.0 * rand.nextDouble();
    return newHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/Building-3.png"),
      height: 300.0,
    );
  }
}
