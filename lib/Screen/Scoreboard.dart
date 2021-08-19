import 'package:flutter/material.dart';

class ConfirmDialog {
  static void showPlayAgain(BuildContext context,
      void Function() playAgainPressed, final String score) {
    // set up the buttons
    final Widget playAgainButton = FlatButton(
      onPressed: () {
        // pop the dialog
        Navigator.of(context).pop();
        // call the restartGame method
        playAgainPressed();
      },
      child: const Text("Play Again",
          style: TextStyle(color: Colors.black, fontSize: 20)),
    );

    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      backgroundColor: Colors.amber[600],
      title: Text(
        "GAME OVER!\n\nScore: $score",
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        playAgainButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
