import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/result_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.answers,
  });

  final List<String> answers;

  List<Map<String, Object>> get summary {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': answers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var correctAnswersLength =
        summary.where((s) => s['correctAnswer'] == s['userAnswer']).length;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswersLength out of ${questions.length} questions correctly!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ResultSummaryWidget(summary: summary),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart quiz!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
