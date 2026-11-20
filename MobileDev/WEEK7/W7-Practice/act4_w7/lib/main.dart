import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = 'assets/dices/dice-1.png';
  void rollDice() {
    //  Display the dice 4 !
    setState(() {
      final num = Random().nextInt(6) + 1;
      activeDiceImage = 'assets/dices/dice-$num.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeDiceImage, width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);
