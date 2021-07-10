import 'package:flutter/material.dart';
import 'pages/search_location.dart';
import 'pages/loading.dart';
import 'pages/home_page.dart';
import 'pages/questions.dart';
import 'pages/Graph_page.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/home':(context)=>Home(),
        '/loading':(context)=>Loading(),
        '/location':(context)=>Location(),
        '/questions':(context)=>Questions(),
        '/graph':(context)=>Graph(), 
      },
  ));
  
}