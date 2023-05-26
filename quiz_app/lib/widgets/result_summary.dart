import 'package:flutter/material.dart';

class ResultSummaryWidget extends StatelessWidget {
  const ResultSummaryWidget({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary
              .map(
                (data) => Row(
                  children: [
                    Text(
                      ((data['index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data['question'] as String,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['correctAnswer'] as String,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['userAnswer'] as String,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
