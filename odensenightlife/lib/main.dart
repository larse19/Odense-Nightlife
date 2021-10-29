import 'package:flutter/material.dart';
import 'package:odensenightlife/screens/bars.dart';
import 'package:odensenightlife/screens/homescreen.dart';
import 'package:odensenightlife/screens/locationListScreen/locationListScreen.dart';
import 'package:odensenightlife/screens/locationInfoScreen/locationInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        '/bars': (context) => Bars(),
        '/locationListScreen': (context) => LocationListScreen(),
        '/locationListItemInfo': (context) => LocationInfo(),
      },
      home: HomeScreen(),
    );
  }
}
