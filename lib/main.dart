import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final int MAX_VALUE = 6;
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(MAX_VALUE) + 1;
      rightDiceNumber = Random().nextInt(MAX_VALUE) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Image.asset('images/dice${leftDiceNumber}.png'),
              onPressed: rollDice,
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: rollDice,
                child: Image.asset('images/dice${rightDiceNumber}.png')),
          ),
        ],
      ),
    );
  }
}
