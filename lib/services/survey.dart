import 'package:flutter/material.dart';
class Survey
{
  String option1;
  String option2;
  String option3;
  String option4;
  String question;
  BuildContext context;
  Survey({required this.option1, required this.question,required this.option2,required this.option3,required this.option4,required this.context});
  makeBar()
  {
    AlertDialog alert = AlertDialog(
    title: Text("You got covid",style:TextStyle(
      fontSize:20
    )),
    content: Text("Have a nice day! :):("),
    actions: [
      TextButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text("ok"),
      )
    ],
  );
    return Column(
      children: [
        SizedBox(height: 200,),
        Text(question,style:TextStyle(
          fontSize:30,
          color:Colors.white,
          letterSpacing: 2,
        )),
        SizedBox(height: 50,),
        Row(
          children: [
            TextButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
              },
                          child: Text(option1,style:TextStyle(
           fontSize:15,
          color:Colors.white,
          letterSpacing: 2,
        )),
            ),
        SizedBox(width: 100,),
        
        TextButton(
          onPressed: (){
            
          },
                  child: Text(option3,style:TextStyle(
             fontSize:15,
            color:Colors.white,
            letterSpacing: 2,
          )),
        ),
          ], 
        ),
        SizedBox(height:50),
        Row(
          children: [
            TextButton(
              onPressed: (){

              },
                          child: Text(option2,style:TextStyle(
          fontSize:15,
          color:Colors.white,
          letterSpacing: 2,
        )),
            ),
         SizedBox(width: 100,),
        TextButton(
          onPressed: (){

          },
                  child: Text(option4,style:TextStyle(
            fontSize:15,
            color:Colors.white,
            letterSpacing: 2,
          )),
        ),
          ], 
        ),
      ],
    );
  }
    void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}