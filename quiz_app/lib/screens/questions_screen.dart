import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  bool isLast = false;
  int currentIndex = 0;

  void next(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffledAnswers.map(
              (String answer) {
                return AnswerButton(
                  text: answer,
                  onPress: () => next(answer),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
