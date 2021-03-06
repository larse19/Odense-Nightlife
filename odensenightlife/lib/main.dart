import 'package:flutter/material.dart';
import 'package:odensenightlife/screens/homescreen.dart';
import 'package:odensenightlife/screens/locationListScreen/locationListScreen.dart';
import 'package:odensenightlife/screens/InfoScreen/locationInfo.dart';
import 'package:odensenightlife/screens/navigationScreen/navigationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        '/locationListScreen': (context) => LocationListScreen(),
        '/locationListItemInfo': (context) => LocationInfo(),
        '/navigationScreen': (context) => MapView()
      },
      home: HomeScreen(),
    );
  }
}
