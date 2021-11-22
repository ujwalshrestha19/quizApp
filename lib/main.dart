import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var indexValue = 0;
  var finalScore = 0;

  var questionList = [
    {
      'questionText': 'What is your name?',
      'answer': [
        {'text': 'ram', 'score': 10},
        {'text': 'shyam', 'score': 20},
        {'text': 'ujwal', 'score': 30}
      ],
    },
    {
      'questionText': 'Where do you live?',
      'answer': [
        {'text': 'pkr', 'score': 10},
        {'text': 'Ktm', 'score': 20},
        {'text': 'Bkt', 'score': 30}
      ],
    },
    {
      'questionText': 'What is your work?',
      'answer': [
        {'text': 'teacher', 'score': 10},
        {'text': 'Develepoer', 'score': 20},
        {'text': 'Doctor', 'score': 30}
      ],
    }
  ];

  void myFunction(int score) {
    setState(() {
      indexValue = indexValue + 1;
      finalScore = finalScore + score;
    });
  }

  void restartFunction() {
    setState(() {
      indexValue = 0;
    });

    print("Restart Fired");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Quiz App"),
              centerTitle: true,
            ),
            body: indexValue < questionList.length
                ? Column(
                    children: [
                      Question(
                          questionList[indexValue]['questionText'] as String),
                      ...(questionList[indexValue]['answer']
                              as List<Map<String, Object>>)
                          .map((answer) {
                        return Answer(answer['text'],
                            () => myFunction(answer['score'] as int));
                      }).toList()
                    ],
                  )
                : Result(restartFunction, finalScore)));
  }
}
