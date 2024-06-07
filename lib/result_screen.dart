import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You answered $numberOfCorrectQuestions out of $numberOfTotalQuestions questions correctly',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  QuestionSummary(summaryData: summaryData),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Restart Quiz'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
