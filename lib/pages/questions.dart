import 'package:flutter/material.dart';
import 'package:covid_tracker/services/survey.dart';
class Questions extends StatefulWidget {
  const Questions({ Key? key }) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold

    (
      appBar: AppBar(
        backgroundColor: Colors.black,
        
      ),
      backgroundColor: Colors.black,
      body:Column(children: [
        Survey(option1: "A. Yes I Do  ", question: "Do You Have Covid?????", option2: "B. No I Dont", option3: "C.  Maybe?...", option4: "D.  Who Cares?",context: context).makeBar(),
      ],)
    );
    
  }
}