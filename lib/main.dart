import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Dicee"),
        backgroundColor: Colors.teal,
      ),
      body: DiceApp(),
    ),
  ));
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  void diceChangeFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  int leftDiceNumber = 5;
  int rightDice = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextButton(
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
                onPressed: () {
                  diceChangeFace();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    rightDice = Random().nextInt(6) + 1;
                    leftDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$rightDice.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
