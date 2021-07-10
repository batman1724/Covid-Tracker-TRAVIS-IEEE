import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid_tracker/services/Covid_tracker.dart';
import 'package:time/time.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
void setUpData()async
{
CovidTracker obj=new CovidTracker();
await obj.getData();
Map data=obj.info;
Navigator.pushReplacementNamed(context,'/location',arguments: data);
}
@override
void initState()
{
  super.initState();
  setUpData();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: Column(

          children: [
          SizedBox(
            height: 300,
          ),
            Text("TRAVIS",style:TextStyle(
              color: Colors.white,
              fontSize:50,
              letterSpacing: 2.5,
            )),
            SpinKitWave(
            color: Colors.white,
            size:50
          ),
          ],
        ),
      )
  
    );
    
  }
}