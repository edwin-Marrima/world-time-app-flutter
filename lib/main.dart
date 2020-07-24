import 'package:flutter/material.dart';
import 'package:mobile/pages/choose_location.dart';
import 'package:mobile/pages/home.dart';
import 'package:mobile/pages/loading.dart';

void main() => runApp(MaterialApp(

initialRoute: '/',
  routes: {
  '/': (context) => Loading(),
    '/home': (context)=>Home(),
    '/location': (context) =>ChooseLocation()

  } ,
));




