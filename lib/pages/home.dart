import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState(){
    super.initState();

  }

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map:data;

    String bg = data['isDayTime']?"day.png":"night.png";

    return Scaffold(

      body: SafeArea(

        child : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(

            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async{

                    dynamic result = await  Navigator.pushNamed(context, '/location');
                    setState(() {
                      data['location'] = result['location'];
                      data['isDayTime'] = result['isDayTime'];
                      data['time'] = result['time'];
                      data['url'] = result['url'];
                      data['flag'] = result['flag'];
                    });

                  },
                  label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                  ),
                icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                ),
              ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
              SizedBox(height: 70,),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                ),

              ),
            ],
          ),
        )
      ),
    );
  }
}
