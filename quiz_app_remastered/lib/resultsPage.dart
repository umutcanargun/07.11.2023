import 'package:flutter/material.dart';
import 'package:quiz_app_remastered/startPage.dart';

class resultsPage extends StatelessWidget {
  final int trueAnswerCount;
  final storeAnswers;
  const resultsPage(
      {Key? key, required this.trueAnswerCount, required this.storeAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ListView.builder(
              itemCount: storeAnswers.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text((storeAnswers[index]).toString()),
                );
              }),
          SizedBox(
            child: Text(
              "Quiz is over, score is $trueAnswerCount over 10",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  backgroundColor: Colors.grey),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => startPage()),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
            ),
            child: const Text("Restart",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          )
        ],
      ),
    );
  }
}
