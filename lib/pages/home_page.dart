import 'package:flutter/material.dart';
import 'search_location.dart';
import 'package:covid_tracker/services/extra_tabs.dart';
import 'package:covid_tracker/services/infoboxes.dart';
import 'package:covid_tracker/services/number_formater.dart';
import 'package:covid_tracker/services/chosen_country.dart';
import 'package:covid_tracker/pages/questions.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fieldText = TextEditingController();
  Widget build(BuildContext context) {
    int tracker=0;
    Formater obj=new Formater();
    dynamic data=ModalRoute.of(context)!.settings.arguments;
    String confirmed_total=obj.format(data['latest_data']['confirmed'].toString());
    String deaths_total=obj.format(data['latest_data']['deaths'].toString());
    String recovered_total=obj.format(data['latest_data']['recovered'].toString());
    String name=data['name'];
    Choose o=new Choose();
    var country_data=new Map();
    return 
    Scaffold(
      
      backgroundColor: Colors.black,
      appBar:AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title:Text("  COVI-TRACKER",style: TextStyle(fontSize: 30,
        letterSpacing: 2,
        fontWeight: FontWeight.w700
        ),
      
        ),
        // centerTitle: true,
        // actions: [
          
        //   IconButton(
        //     icon:Icon(Icons.add_location),
        //     splashRadius: 15,
        //     onPressed: ()
        //     {
        //       Navigator.pop(context);
        //     },
        //   )
        // ],
        ),
        body: SafeArea(
          
                  child: Center(
            
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness:2,
                  color:  Colors.white70,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("$name's Fight",style:
                  TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                    fontSize: 30
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
               
               
                Center(
                  child: Column(  
                      children: [
                        SizedBox(height: 10,),
                        InfoText(main_text: confirmed_total, sub_text: "Total Confirmed Cases",number: 1).makeBar(),
                        InfoText(main_text: deaths_total, sub_text: "fatal Cases",number: 2).makeBar(),
                        InfoText(main_text: recovered_total, sub_text: "Recovered  Cases",number:10).makeBar(),
                      ],
                    ),
                ),
                Column(
                  children: [
                SizedBox(height:80),
                ExtraTabs(image:'images/circle-cropped.png',main_text: "COVID Check-In Survey   ",sub_text: "Let us know if you have any symptoms today",navigate_to: '/questions',context: context).makeBar(),
                SizedBox(height:5),
                ExtraTabs(image:'images/globe.png',main_text:"The International Picture",sub_text: "Tap to find out more",navigate_to: '/questions',context: context).makeBar(),
                SizedBox(height: 30,),
                Divider(
                  thickness: 2,
                  color: Colors.white70,
                ),

                  ],
                ),
               
                   
              ],
            ),
          ),
        )
    );
    
  }
}
