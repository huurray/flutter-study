import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> selectedAnswer = [];

  var activeScreen = 'start';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void selectAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if (activeScreen == 'questions') {
      screen = QuestionsScreen(
        onSelectAnswer: selectAnswer,
      );
    }

    if (activeScreen == 'result') {
      screen = ResultScreen(answers: selectedAnswer);
    }

    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange, Color.fromARGB(255, 228, 74, 27)],
              ),
            ),
            child: screen
            // : const QuestionsScreen(),
            ),
      ),
    );
  }
}
