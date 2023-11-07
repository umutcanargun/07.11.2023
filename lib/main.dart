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
            //Image.asset("assets/pngwing.com.png"),
            const Text(
              "Welcome to Math Quiz",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(fixedSize: const Size(180, 60)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuestionScreen()),
                );
              },
              icon: const Icon(
                Icons.arrow_right_alt,
                size: 40.0,
                color: Colors.red,
              ),
              label: const Text(
                "Start",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                ),
              ),
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
  var storeAnswers = <String>[];

  void checkAnswer(String selectedAnswer) {
    if (questions[initialQuestionIndex].trueAnswer == selectedAnswer) {
      setState(() {
        storeAnswers.add(
            "The question was ${questions[initialQuestionIndex].question}, your answer was ${selectedAnswer}");
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
              properlyAnsweredQuestions: properlyAnsweredQuestions,
              storeAnswers: storeAnswers),
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
          Text(
            questions[initialQuestionIndex].question,
            style: const TextStyle(fontSize: 25.0),
          ),
          ...questions[initialQuestionIndex].options.map((answer) {
            return OutlinedButton(
                onPressed: () {
                  checkAnswer(answer);
                },
                style: OutlinedButton.styleFrom(fixedSize: const Size(200, 80)),
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      color: Colors.red,
                      fontSize: 25.0),
                ));
          }),
          //const SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int properlyAnsweredQuestions;
  final storeAnswers;

  const ResultScreen(
      {Key? key,
      required this.properlyAnsweredQuestions,
      required this.storeAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: storeAnswers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      storeAnswers[index],
                      style: TextStyle(fontSize: 15.0),
                    );
                  }),
            ),
            Text(
              "Quiz is over, score is $properlyAnsweredQuestions over 10",
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
