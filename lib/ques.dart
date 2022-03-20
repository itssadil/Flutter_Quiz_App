import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quiz/result.dart';

class stlQuiz extends StatefulWidget {
  const stlQuiz({Key? key}) : super(key: key);

  @override
  _stlQuizState createState() => _stlQuizState();
}

List quizList = [
  {
    "id": 1,
    "question": "What does HTML stand for?",
    "options": [
      'Home Tool Markup Language',
      'Hyper Text Markup Language',
      'Hyperlinks and Text Markup Language',
      'Hyper links Markup Language'
    ],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "Solve:  -7 - 4c = -c + 8",
    "options": ['C = -5', 'C = -3', 'C = 5', 'C = 3'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Python is _____ programming language.",
    "options": ['low-level', 'high-level', 'mid-level', 'none of the above'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Which of the following is not a programming language?",
    "options": ['TypeScript', 'Python', 'Anaconda', 'Java'],
    "answer_index": 3,
  },
  {
    "id": 5,
    "question": "The first Unix based computer has been made in_____.",
    "options": ['1929', '1939', '1949', '1959'],
    "answer_index": 4,
  },
  {
    "id": 6,
    "question": "Which language can be directly understood by the CPU?",
    "options": ['Assembly language', 'JAVA', 'C', 'All of the above'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "RGB stands for:",
    "options": [
      'Red, Green, Black',
      'Red, gray, Black',
      'Red, gray, Blue',
      'Red, Green, Blue'
    ],
    "answer_index": 4,
  },
  {
    "id": 8,
    "question": "When was MongoDB first developed? ",
    "options": ['2005', '2006', '2007', '2008'],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "MongoDB is a__ type of database.",
    "options": [
      'SQL database',
      'NoSQL database',
      'Row database',
      'Column database'
    ],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "What type of document storage does MongoDB make use of?",
    "options": ['DOCX', 'JQUERY', 'JSON', 'BSON'],
    "answer_index": 4,
  },
];

int lnt = quizList.length;
int count = 0;
int res = 0;
int timeText = 11;
double per = 0;
Color clr = Colors.green;

class _stlQuizState extends State<stlQuiz> {
  mans(String ans, int aid, int ansin) {
    setState(() {
      if (lnt - 1 > count) {
        timeText = 11;
        if (aid == ansin) {
          res++;
          Timer(Duration(seconds: 1), calBak);
          super.initState();
        } else {
          Timer(Duration(seconds: 1), calBak);
          super.initState();
        }
      } else {
        if (aid == ansin) {
          res++;
        }
        Timer(Duration(seconds: 2), calBakRout);
        super.initState();
      }
    });
  }

  void calBak() {
    setState(() {
      count++;

      per = count / lnt.toDouble();
    });
  }

  void calBakRout() {
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const result(res: 'res', lnt: 'lnt')));
    });
  }

  timcng() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timeText < 1) {
          timeText = 10;
          if (lnt - 1 > count) {
            calBak();
          } else {
            calBakRout();
            t.cancel();
          }
        } else {
          timeText = timeText - 1;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timcng();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quizList[count]['question'],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          qAns(),
          Text(
            "${count}/${lnt}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: LinearProgressIndicator(
              value: per,
              minHeight: 8,
              color: Colors.blueAccent,
            ),
          ),
          Center(
            child: CircleAvatar(
              child: Text(
                timeText.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget qAns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        qBtn(
            ans: quizList[count]['options'][0],
            aid: 1,
            ansin: quizList[count]['answer_index']),
        qBtn(
            ans: quizList[count]['options'][1],
            aid: 2,
            ansin: quizList[count]['answer_index']),
        qBtn(
            ans: quizList[count]['options'][2],
            aid: 3,
            ansin: quizList[count]['answer_index']),
        qBtn(
            ans: quizList[count]['options'][3],
            aid: 4,
            ansin: quizList[count]['answer_index']),
      ],
    );
  }

  Widget qBtn({required String ans, required int aid, required int ansin}) {
    return ElevatedButton(
      onPressed: () => mans(ans, aid, ansin),
      child: Text('$ans'),
      style: ElevatedButton.styleFrom(primary: clr),
    );
  }
}
