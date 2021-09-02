import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'CustomTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  @override
  void setWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'german.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'url' : instance.url,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  void initState(){
    super.initState();
    setWorldTime();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(

              color: Colors.white,


        ),
      ),
    );
  }
}

