
import 'package:flutter/material.dart';
import 'package:quiz_app_remastered/questionsPage.dart';

class startPage extends StatelessWidget{
  const startPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/mathSigns.png'),
          const Text('Welcome to Mathematics Quiz',style: TextStyle(color:Colors.black,fontSize: 20)),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const questionsPage()),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
            ),
            child: const Text("Start",style: TextStyle(color:Colors.black,fontSize: 20)),
          ),
        ]

      ),),
    );
  }
}