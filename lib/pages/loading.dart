import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:mobile/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WordTime instance = WordTime(location:'Maputo',flag: 'germany.png',url: 'Africa/Maputo');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
        child:  SpinKitDoubleBounce(
          color: Colors.amberAccent,
          size: 90.0,
        ),
      ),
    );
  }
}
