import 'package:covid_tracker/pages/Graph_page.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/pages/home_page.dart';
import 'package:covid_tracker/pages/questions.dart';
class ExtraTabs
{
  String image;
  String main_text;
  String sub_text;
  String navigate_to;
  BuildContext context;
  ExtraTabs({required this.image,required this.main_text,required this.sub_text,required this.navigate_to,required this.context});
  makeBar()
  {
    return Container(
      width: 375,
      height: 70,
      decoration: BoxDecoration(
                            border: Border.all(
                           color: Colors.white,
                        ),
                        color:Colors.white,
                        //color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                           ),
      child:Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage:AssetImage(image),
          ),
          SizedBox(width: 20,),
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              main_text,style:TextStyle
            (
              color:Colors.black,
              fontSize:20,
            )),
            Text(sub_text,style:TextStyle(
              color: Colors.grey,
              fontSize: 11,
            )
            )
            ],
          ),
          SizedBox(
            width: 35,
          ),
          IconButton(
            splashColor: Colors.red,
            splashRadius: 10,

            onPressed: ()
            {
              if(main_text.trim().trim().compareTo('COVID Check-In Survey')==0)
                Navigator.of(context).push(_createRoute());
              else
                Navigator.of(context).push(_createRoute2());
            },
            icon:Icon(Icons.arrow_forward_ios)
          )
        ],
      )
    );
  }
  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Questions(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1,0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Graph(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1, 0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

  
}