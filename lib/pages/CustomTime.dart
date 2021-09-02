import 'package:http/http.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'package:intl/intl.dart';

class WorldTime{
  String url="";
  String location="";
  String flag="";
  String time="";
  bool isDayTime = false;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    try {
      Uri temp = Uri.parse('http://worldtimeapi.org/api/timezone/$url');

      Response response = await get(temp);
      Map data = jsonDecode(response.body);


      String dateTime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));

      if(now.hour<20&&now.hour>6){
        isDayTime = true;
      }

      time = DateFormat.jm().format(now);
    }
    catch(e){
      time = "could not find time data";
    }
  }

}