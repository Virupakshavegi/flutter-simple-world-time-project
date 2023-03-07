

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
 class WorldTime{
  String? location; //location name for the UI
  String time=""; // the time  in that location
  String? flag; //url to an asset flag icon
  String? url; //location url for api endpoint
  bool? isDaytime; //true or false depending on whether it is day or not

  WorldTime({ this.location,this.flag,this.url});

  Future <void>  getTime() async {
   //make Request
   Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
   Map data=jsonDecode(response.body);
   //print(data);

   //get  properties from data
   String datetime=data['datetime'];
   String offset=data['utc_offset'];
   //print(datetime);
   //print(offset);

   //create Datetime object
   DateTime now=DateTime.parse(datetime.substring(0,26));
   //String Datetime= data['datetime'].substring(0,26);
   //DateTime now=DateTime.parse(datetime);
   //now=now.add(Duration(hours: int.parse(offset)));
   //print(now);

   //Set the time property
   //ternary operator
   isDaytime=now.hour > 6 && now.hour < 20? true : false;
   time = DateFormat.jm().format(now);



  }
 }

