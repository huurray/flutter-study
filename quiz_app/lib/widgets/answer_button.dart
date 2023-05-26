import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
