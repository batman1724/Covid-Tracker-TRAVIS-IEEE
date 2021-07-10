import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

class CovidTracker
{
  late Map info;
  Future <void> getData()async
  {
    try
    {
      Response response=await get(Uri.parse('https://corona-api.com/countries'));
      info=jsonDecode(response.body);  
    }
  catch(e)
  {
    print(e);
    print("data not found");
  }
  }
}