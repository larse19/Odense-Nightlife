import 'package:flutter/material.dart';
import 'package:odensenightlife/screens/bars.dart';
import 'package:odensenightlife/screens/cocktails.dart';
import 'package:odensenightlife/screens/homescreen.dart';
import 'package:odensenightlife/screens/clubs.dart';
import 'package:odensenightlife/screens/pubs.dart';
import 'package:odensenightlife/screens/winehouses.dart';
import 'package:odensenightlife/screens/locationList.dart';

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
        '/clubs': (context) => Clubs(),
        '/cocktailbars': (context) => Cocktails(),
        '/winehouses': (context) => Winehouses(),
        '/pubs': (context) => Pubs(),
        '/locations': (context) => LocationList()
      },
      home: HomeScreen(),
    );
  }
}
