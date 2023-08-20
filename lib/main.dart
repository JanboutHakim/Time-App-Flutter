import 'package:flutter/material.dart';
import 'package:world_time/pages/Choose_location.dart';
import 'package:world_time/pages/Home.dart';
import 'package:world_time/pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    //   home: Home(),
    // initialRoute: '/Home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChoseLocation()
    },
  ));
}
