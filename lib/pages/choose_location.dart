import 'dart:html';
import 'CustomTime.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {


  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState(){
    super.initState();
  }

  void getData() async{

  }



  Widget build(BuildContext context) {
    List<WorldTime> locations = [
      WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
      WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
      WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    ];

    void updateTime(index) async{
        WorldTime instance = locations[index];
        await instance.getTime();
        Navigator.pop(context,{
          'location' : instance.location,
          'flag' : instance.flag,
          'url' : instance.url,
          'time' : instance.time,
          'isDayTime' : instance.isDayTime,
        });
    }



    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Choose A Location"),
        elevation: 0,
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          String temp = locations[index].flag;
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);

                },
                title: Text(locations[index].location),
                leading: CircleAvatar(

                  backgroundImage: AssetImage('assets/$temp'),
                ),
              ),
            ),
          );
        }
      )

    );
  }
}
