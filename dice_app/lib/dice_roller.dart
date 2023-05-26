import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = '1';

  void _rollDice() {
    var random = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = '$random';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$activeDiceImage.png',
          width: 180,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: _rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: const Text(
            'Roll Dice',
          ),
        )
      ],
    );
  }
}
