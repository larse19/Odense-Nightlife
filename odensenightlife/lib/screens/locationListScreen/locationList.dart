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
  bool sortingPrice = false;
  bool sortingRating = false;
  bool ascending = false;

  callback(String sortType, Function changeIcon, int index) {
    if (sortType == "distance") {
      setState(() {
        if (!sortingDist) {
          sortingPrice = false;
          sortingName = false;
          sortingRating = false;
          ascending = true;
          sortingDist = true;
        } else {
          ascending = !ascending;
        }
        changeIcon(index, ascending);
      });
    } else if (sortType == "name") {
      setState(() {
        if (!sortingName) {
          sortingDist = false;
          sortingPrice = false;
          sortingRating = false;
          ascending = true;
          sortingName = true;
        } else {
          ascending = !ascending;
        }
        changeIcon(index, ascending);
      });
    } else if (sortType == "pricing") {
      setState(() {
        if (!sortingPrice) {
          sortingDist = false;
          sortingName = false;
          sortingRating = false;
          ascending = true;
          sortingPrice = true;
        } else {
          ascending = !ascending;
        }
        changeIcon(index, ascending);
      });
    } else if (sortType == "rating") {
      setState(() {
        if (!sortingRating) {
          sortingDist = false;
          sortingName = false;
          sortingPrice = false;
          sortingRating = true;
          ascending = true;
        } else {
          ascending = !ascending;
        }
        changeIcon(index, ascending);
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
                  } else if (sortingPrice) {
                    if (ascending) {
                      return a.pricing.compareTo(b.pricing);
                    } else {
                      return b.pricing.compareTo(a.pricing);
                    }
                  } else if (sortingRating) {
                    if (ascending) {
                      return a.rating.compareTo(b.rating);
                    } else {
                      return b.rating.compareTo(a.rating);
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
