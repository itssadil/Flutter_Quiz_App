import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:quiz/ques.dart';
import 'package:flutter/services.dart';

void main() {
  // disable Landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  // MyApp
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: stlQuiz(),
      ),
    );
  }
}
