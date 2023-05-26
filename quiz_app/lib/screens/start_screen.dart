import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() switchScreen;

  const StartScreen(this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Let\'s go!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              elevation: 0,
              side: const BorderSide(width: 1, color: Colors.white),
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
