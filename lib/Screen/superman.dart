import 'package:flutter/cupertino.dart';

/// create a [Stateless] widget superman
/// which returns a [container] with the
/// child as [image] - "superman.png" from the [assets]

class Superman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/superman.png"),
      width: 80.0,
      height: 80.0,
    );
  }
}
