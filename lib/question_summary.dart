import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Assuming 'question_index' should be displayed as a number
                        // Text((data['question_index'] as int).toString()),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.orangeAccent),
                        ),
                        if(data['user_answer'] as String == data['correct_answer'] as String)
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.green),
                          ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
