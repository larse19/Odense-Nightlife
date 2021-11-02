import 'package:flutter/material.dart';
import '../data/argumentModels.dart';

class HomeScreen extends StatelessWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    primary: Color(0xff2EC4B6),
    minimumSize: Size(350, 75),
    padding: EdgeInsets.all(5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff385F71),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Color(0xff2EC4B6),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: new Text(
                "What are you looking for?",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(5),
              child: new ElevatedButton(
                child: Text('Bars',
                    style: TextStyle(
                      fontSize: 48,
                    )),
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/locationListScreen',
                      arguments: LocationListArguments("bar"));
                },
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(5),
              child: new ElevatedButton(
                child: Text('Clubs',
                    style: TextStyle(
                      fontSize: 48,
                    )),
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/locationListScreen',
                      arguments: LocationListArguments("club"));
                },
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(5),
              child: new ElevatedButton(
                child: Text('Cocktail Bars',
                    style: TextStyle(
                      fontSize: 48,
                    )),
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/locationListScreen',
                      arguments: LocationListArguments("cocktailbar"));
                },
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(5),
              child: new ElevatedButton(
                child: Text('Wine Houses',
                    style: TextStyle(
                      fontSize: 48,
                    )),
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/locationListScreen',
                      arguments: LocationListArguments("wineHouse"));
                },
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(5),
              child: new ElevatedButton(
                child: Text('Pubs',
                    style: TextStyle(
                      fontSize: 48,
                    )),
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/locationListScreen',
                      arguments: LocationListArguments("pub"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
