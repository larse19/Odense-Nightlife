import 'package:flutter/material.dart';
import 'package:odensenightlife/util/distanceCalculator.dart';
import '../../data/place.dart';
import '../../data/place_dao.dart';
import 'locationListItem.dart';
import 'package:location/location.dart';
import 'flowButton.dart';

class LocationList extends StatefulWidget {
  final locationDao = PlaceDao();
  final String type;
  final LocationData locationData;

  LocationList({required this.type, required this.locationData});

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  bool sortingName = false;
  bool sortingDist = false;
  bool ascending = false;

  //den her funktion skal kunne ses fra flowButton.dart på en eller anden magisk måde
  callback(String sortType) {
    if (sortType == "distance") {
      setState(() {
        sortingName = false;
        sortingDist = true;
        ascending = !ascending;
      });
    } else if (sortType == "name") {
      setState(() {
        sortingDist = false;
        sortingName = true;
        ascending = !ascending;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff385f71),
        body: FutureBuilder<List<Place>>(
            future: widget.locationDao.getPlaces(widget.type),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                snapshot.data!.sort((a, b) {
                  double aDist = calculateDistance(widget.locationData.latitude,
                      widget.locationData.longitude, a.latitude, a.longitude);
                  double bDist = calculateDistance(widget.locationData.latitude,
                      widget.locationData.longitude, b.latitude, b.longitude);
                  if (sortingDist) {
                    if (ascending) {
                      return aDist.compareTo(bDist);
                    } else {
                      return bDist.compareTo(aDist);
                    }
                  } else if (sortingName) {
                    if (ascending) {
                      return a.name.compareTo(b.name);
                    } else {
                      return b.name.compareTo(a.name);
                    }
                  } else {
                    return 0;
                  }
                });
                return snapshot.data!.length > 0
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.all(5),
                              child: LocationListItem(
                                location: snapshot.data![index],
                                locationData: widget.locationData,
                              ));
                        })
                    : const Center(
                        child: Text('No Results',
                            style: TextStyle(
                                fontSize: 24, color: Color(0xffffffff))));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        floatingActionButton: FlowMenu(callback));
  }
}
