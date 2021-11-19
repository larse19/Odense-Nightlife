import 'package:flutter/material.dart';
import '../data/argumentModels.dart';
import '../data/place_dao.dart';

class HomeScreen extends StatefulWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    primary: Color(0xff2EC4B6),
    minimumSize: Size(350, 75),
    padding: EdgeInsets.all(5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  final PlaceDao placeDao = PlaceDao();

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff385F71),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Color(0xff385f71),
        centerTitle: true,
      ),
      body: new Builder(builder: (BuildContext context) {
        return Column(children: <Widget>[
          Expanded(
              flex: 1,
              child: Center(
                  child: Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: new Text(
                  "What are you looking for?",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ))),
          Expanded(
              flex: 9,
              child: FutureBuilder<Map<dynamic, dynamic>>(
                  future: widget.placeDao.getTypesOfPlaces(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshot.data!.length > 0
                          ? ListView.builder(
                              itemCount: snapshot.data!
                                  .length, //plus one because the first row is the header
                              itemBuilder: (BuildContext context, int index) {
                                return new Container(
                                  margin: const EdgeInsets.all(5),
                                  child: new ElevatedButton(
                                    child: Text(
                                        snapshot.data!.values.elementAt(index),
                                        style: TextStyle(
                                          fontSize: 48,
                                        )),
                                    style: widget.raisedButtonStyle,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/locationListScreen',
                                          arguments: LocationListArguments(
                                              snapshot.data!.keys
                                                  .elementAt(index)
                                                  .toString(),
                                              snapshot.data!.values
                                                  .elementAt(index)));
                                    },
                                  ),
                                );
                              })
                          : const Center(
                              child: Text('No Results',
                                  style: TextStyle(
                                      fontSize: 24, color: Color(0xffffffff))));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })),
        ]);
      }),
    );
  }
}


/*
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
*/