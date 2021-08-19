import 'dart:async';
import 'package:nerd_man/Screen/Buildings.dart';
import 'package:nerd_man/Screen/clouds.dart';
import 'package:nerd_man/Screen/superman.dart';
import 'package:flutter/material.dart';
import 'Scoreboard.dart';
// import 'dart:math';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static double birdYAxis = 0;
  double time = 0;
  double height = 0;
  int best = 0;
  int score = 0;
  double initHeight = birdYAxis;
  bool hasGameStarted = false;

  static double barrierX1 = 1;
  double barrierX2 = 2 + barrierX1;
  static const double barrierY1 = 1.1;

  void reset() {
    // logic to reset the score
    if (score >= best) {
      best = score;
    }
    score = 0;
  }

  void jump() {
    // logic to make the superman jump
    setState(() {
      time = 0;
      initHeight = birdYAxis;
    });
  }

  void gameOver() {
    ConfirmDialog.showPlayAgain(context, () {
      Homepage();
    }, '$score');
    height = 0;
    time = 0;
    hasGameStarted = false;
    birdYAxis = 0;
    barrierX1 = 1;
    barrierX2 = 2 + barrierX1;
    initHeight = birdYAxis;
    setState(() {
      reset();
    });
  }

  void startGame() {
    // logic to start the game
    hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 14), (timer) {
      time += 0.01;
      height = 2.5 * time - 4.9 * time * time;
      setState(() {
        birdYAxis = initHeight - height;
      });

      setState(() {
        if (barrierX1 < -2.0) {
          barrierX1 += 4.0;
          updateScore();
          // calcNewHeight(barrierX1);
        } else {
          barrierX1 -= 0.03;
        }
      });

      setState(() {
        if (barrierX2 < -2.0) {
          barrierX2 += 4.0;
          updateScore();
          // calcNewHeight(barrierX2);
        } else {
          barrierX2 -= 0.03;
        }
      });

      if (birdYAxis > 1.1) {
        cancleTheGame(timer);
      }

      if ((barrierX1 < 0.3 && barrierX1 > -0.3) &&
          (birdYAxis > 0 || (birdYAxis < -0.55 && birdYAxis > -0.8))) {
        cancleTheGame(timer);
      }

      if ((barrierX2 < 0.3 && barrierX2 > -0.3) &&
          (birdYAxis > 0 || (birdYAxis < -0.55 && birdYAxis > -0.8))) {
        cancleTheGame(timer);
      }
    });
  }

  void cancleTheGame(Timer timer) {
    // logic to cancel the game
    timer.cancel();
    gameOver();
  }

  // void calcNewHeight(double newHeight) {
  //   // logic to change the new height in game
  //   Random rand = new Random();
  //   newHeight = rand.nextDouble();
  // }

  void updateScore() {
    if ((barrierX1 < 0.3 && barrierX1 > -0.3)) {
      score++;
    }

    if ((barrierX2 < 0.3 && barrierX2 > -0.3)) {
      score++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (hasGameStarted) {
          jump();
        } else {
          startGame();
          Future.delayed(Duration(seconds: 1), () {
            score = 1;
          });
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYAxis),
                      color: Colors.amber[600],
                      duration: Duration(milliseconds: 0),
                      child: Superman(),
                    ),
                    Container(
                      alignment: const Alignment(0, -0.3),
                      child: hasGameStarted
                          ? const Text('')
                          : const Text(
                              'T A P  TO  P L A Y',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX1, barrierY1),
                      duration: const Duration(milliseconds: 0),
                      child: Building(),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX1, -0.8),
                      duration: const Duration(milliseconds: 0),
                      child: Clouds(),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX2, barrierY1),
                      duration: const Duration(milliseconds: 0),
                      child: Building(),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX2, -0.8),
                      duration: const Duration(milliseconds: 0),
                      child: Clouds(),
                    ),
                  ],
                )),
            Container(
              height: 15,
              color: Colors.amber[800],
            ),
            Expanded(
              child: Container(
                color: Colors.amber[300],
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(height: 50.0),
                          Container(
                            child: Center(
                                child: Text(
                              'SCORE',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: Center(
                                child: Text(
                              '$score',
                              style: TextStyle(
                                fontSize: 38.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(height: 50.0),
                          Container(
                            child: Center(
                                child: Text(
                              'BEST',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: Center(
                                child: Text(
                              '$best',
                              style: TextStyle(
                                fontSize: 38.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
