import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_application_3/models/quiz_question.dart';

import 'package:flutter_application_3/data/questions.dart';

void main() {
  runApp(const MaterialApp(home: StartScreen()));
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/pngwing.com.png"),
            const Text(
              "Welcome to Math Quiz",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuestionScreen()),
                );
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20)),
            ),
          ],
        ),
      ),
    );
  }
}

// Boilerplate

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int initialQuestionIndex = 0;
  int properlyAnsweredQuestions = 0;

  void checkAnswer(String selectedAnswer) {
    if (questions[initialQuestionIndex].trueAnswer == selectedAnswer) {
      setState(() {
        properlyAnsweredQuestions++;
      });
    }
    if (initialQuestionIndex < questions.length - 1) {
      setState(() {
        initialQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
              properlyAnsweredQuestions: properlyAnsweredQuestions),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(questions[initialQuestionIndex].question),
          ...questions[initialQuestionIndex].options.map((answer) {
            return OutlinedButton(
                onPressed: () {
                  checkAnswer(answer);
                },
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      color: Colors.black),
                ));
          }),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int properlyAnsweredQuestions;

  const ResultScreen({Key? key, required this.properlyAnsweredQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz is over, $properlyAnsweredQuestions questions were answered correctly!",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start the Quiz Again",
                style: TextStyle(fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
