import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// create a [Stateless] widget cloud
/// which returns a [container] with the
/// child as [image] - "cloud.png" from the [assets]
class Clouds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/clouds.png"),
      height: 100,
      width: 150,
    );
  }
}
