import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:covid_tracker/services/number_formater.dart';
class Location extends StatefulWidget {
  const Location({ Key? key }) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
  
}

class _LocationState extends State<Location> {
   final fieldText = TextEditingController();
   String world_wide_cases="";
   String fatal_cases="";
   String recovered_cases="";
   int sum_cases=0;
   int sum_deaths=0;
   int sum_recovered=0;
   String name=" ";
   
    int chosen_country(String name,Map data)
  {
    String hold="";
    name=name.toLowerCase();
    for(int i=0;i<249;i++)
    {
      hold=data['data'][i]['name'].toString();
      if(hold.toLowerCase().compareTo(name)==0)
        {
            return i;
        }
    }
   return -1;
  }


  @override
  Widget build(BuildContext context) {
    //String country="india";
    int tracker=0;
      sum_cases=0;
      sum_recovered=0;
      sum_deaths=0;
    var country_data=new Map();
    dynamic data=ModalRoute.of(context)!.settings.arguments;
        for(int i=0;i<249;i++)
    {
      sum_cases=sum_cases+int.parse(data['data'][i]['latest_data']['confirmed'].toString());
      sum_recovered=sum_deaths+int.parse(data['data'][i]['latest_data']['recovered'].toString());
      sum_deaths=sum_deaths+int.parse(data['data'][i]['latest_data']['deaths'].toString());
    }
    
    Formater obj=new Formater();
    world_wide_cases=obj.format(sum_cases.toString());
    recovered_cases=obj.format(sum_recovered.toString());
    fatal_cases=obj.format(sum_deaths.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: Column(
          children: [
            SizedBox(
              height:60
            ),
            
            SizedBox(
              height: 100,
              width: 350,
              child: TextField(
              style:TextStyle(
              color: Colors.white
              ),
              controller: fieldText,
              cursorColor: Colors.white,
              onSubmitted: (name)async{
                tracker=chosen_country(name, data);
                await showDialog(context: context, builder:(BuildContext context)
                { 
                  name=name[0].toUpperCase()+name.substring(1,name.length);
                  return AlertDialog(
                    title: const Text("Data Being Processed...",style:TextStyle(
                      letterSpacing: 2,
                      fontWeight:FontWeight.w700,
                    )),
                    backgroundColor: Colors.white,
                    content:tracker!=-1?Text("          You have chosen $name!\n            Press ok to continue"):Text("         ERROR: Country not found!\n                       Try Again."),
                   actions: [
                     
                       TextButton(
                       onPressed: (){ tracker!=-1?chosen_country(name, data):tracker=-1;
                       tracker!=-1?country_data=data['data'][tracker]:tracker=-1;
                       tracker==-1?Navigator.pop(context):Navigator.pushReplacementNamed(context,'/home',arguments: country_data);
                       clearText();
                       },
                       child:tracker==-1?Text("back",style:TextStyle(
                         color: Colors.black,
                       )):Text("ok",style:TextStyle(
                         color: Colors.black,))
                     ),
              
                   ],
                  );
                }
                );
              },
                decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.white)),  
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.white),gapPadding:0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search,color: Colors.white,),
                labelText: "Filter Data To A Country",
                labelStyle:TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
                focusColor: Colors.white
              ),
                ),
            ),
            
            CircleAvatar
            (
            backgroundImage:AssetImage('images/animated_globe.png'),
            radius:80
            ),
          //image here
            SizedBox(height:25),
              Text("Confirmed Cases\n      Worldwide",style:
              TextStyle(
                fontSize:40,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.w700
              )),
              SizedBox(height: 10,),
              Divider(
                color: Colors.white38,
                thickness: 2,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(world_wide_cases,style:TextStyle(
                    fontSize:50,
                    letterSpacing: 1.5,
                    color:Colors.white,
                    fontWeight: FontWeight.w700
                  )),
                    Icon(Icons.arrow_upward,
                    color: Colors.green,)
                  
                ],
              ),
              

          ],
        ),
      ),
      
    );
    
  }
  void clearText()
  {
    fieldText.clear();
  }
}
 