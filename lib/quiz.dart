import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/questions_screen.dart';
import 'package:advance_basics/result_screen.dart';
import 'package:advance_basics/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeSreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeSreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeSreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(switchScreen);

    if (activeSreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeSreen == 'results-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: screenWidget,
    );
  }
}
