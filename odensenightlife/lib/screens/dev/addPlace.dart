import 'package:flutter/material.dart';
import '../../data/place.dart';
import '../../data/place_dao.dart';
import 'package:firebase_database/firebase_database.dart';

class PlaceAdder extends StatefulWidget {
  final PlaceDao placeDao = PlaceDao();

  @override
  State<StatefulWidget> createState() => _PlaceAdderState();
}

class _PlaceAdderState extends State<PlaceAdder> {
  void addPlace() async {
    Place place = new Place(
        "Ryan's",
        "id is set automatically",
        "this is the description",
        "https://lh5.googleusercontent.com/p/AF1QipMs3c7y5VfEKPKQeAU3lZ2WA8sTubDffxAwgiwC=w484-h240-k-no",
        "pub",
        55.3974261,
        10.3866601,
        "about",
        "address");

    widget.placeDao.savePlace(place);
    print(place.name + " added to database");
  }

  void addLocationTypes() async {
    FirebaseDatabase.instance.reference().child('locationTypes').set({
      'bar': 'Bars',
      'club': 'Clubs',
      'cocktailbar': 'Cocktial Bars',
      'wineHouse': 'Wine House',
      'pub': 'Pubs'
    });
  }

  void getTypesTest() {
    widget.placeDao
        .getTypesOfPlaces()
        .then((value) => value.forEach((key, value) {
              print(value);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff385f71),
        appBar: AppBar(
          title: Text("Add new place"),
          backgroundColor: new Color(0xff2ec4b6),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ElevatedButton(
                  child: Text('Add place',
                      style: TextStyle(
                        fontSize: 48,
                      )),
                  onPressed: () {
                    getTypesTest();
                  },
                ))));
  }
}
