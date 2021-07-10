import 'package:flutter/material.dart';
import 'package:intl/number_symbols.dart';
class InfoText{
  String main_text;
  String sub_text;
  int number;
  InfoText({required this.main_text,required this.sub_text,required this.number});
  makeBar()
  {
    return Row(

     mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 47),
      if(number==1)
      Icon(Icons.sick
      ,size:35,
      color:Colors.white
      )
      else if(number==2)
      CircleAvatar(
        backgroundImage: AssetImage('images/skull.png'),
        radius: 17,
      )
      else
      Icon(Icons.health_and_safety,
      color: Colors.green,
      size: 40,
      ),
      SizedBox(width: 40),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Text(main_text,style:TextStyle
          (
              color:Colors.white,
              fontSize:50,
          )
          ),
          Text(sub_text,style:TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ))
        ],
      )
    ],);
  }
}