import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Bars'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, minimumSize: Size(150, 40)),
              onPressed: () {
                Navigator.pushNamed(context, '/bars');
              },
            ),
            ElevatedButton(
              child: Text('Clubs'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, minimumSize: Size(150, 40)),
              onPressed: () {
                Navigator.pushNamed(context, '/clubs');
              },
            ),
            ElevatedButton(
              child: Text('Cocktail Bars'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, minimumSize: Size(150, 40)),
              onPressed: () {
                Navigator.pushNamed(context, '/cocktailbars');
              },
            ),
            ElevatedButton(
              child: Text('Wine Houses'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, minimumSize: Size(150, 40)),
              onPressed: () {
                Navigator.pushNamed(context, '/winehouses');
              },
            ),
            ElevatedButton(
              child: Text('Pubs'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, minimumSize: Size(150, 40)),
              onPressed: () {
                Navigator.pushNamed(context, '/pubs');
              },
            ),
          ],
        ),
      ),
    );
  }
}
