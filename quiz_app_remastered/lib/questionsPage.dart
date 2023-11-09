import 'package:flutter/material.dart';
import 'package:quiz_app_remastered/data/questions.dart';
import 'package:quiz_app_remastered/resultsPage.dart';

class questionsPage extends StatefulWidget {
  const questionsPage({Key? key}) : super(key: key);

  @override
  _questionsPage createState() => _questionsPage();
}

class _questionsPage extends State<questionsPage> {
  int questionIndex = 0;
  int trueAnswerCount = 0;
  var storeAnswers = [];

  void checkAnswer(String selectedItem) {
    if (questions[questionIndex].trueAnswer == selectedItem) {
      setState(() {
        storeAnswers.add(
            'question: ${questions[questionIndex].question}, user answer: ${selectedItem}');
        trueAnswerCount++;
      });
    }
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => resultsPage(
              trueAnswerCount: trueAnswerCount, storeAnswers: storeAnswers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              questions[questionIndex].question,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            ...questions[questionIndex].options.map((answer) {
              return OutlinedButton(
                onPressed: () {
                  checkAnswer(answer);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                ),
                child: Text(answer,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              );
            })
          ],
        ),
      ),
    );
  }
}
