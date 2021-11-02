import 'package:flutter/material.dart';
import '../../data/place.dart';
import '../../data/place_dao.dart';
import 'locationListItem.dart';
import 'package:location/location.dart';

class LocationList extends StatefulWidget {
  final locationDao = PlaceDao();
  final String type;
  final LocationData locationData;

  LocationList({required this.type, required this.locationData});

  @override
  State<StatefulWidget> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff385f71),
        body: FutureBuilder<List<Place>>(
            future: widget.locationDao.getPlaces(widget.type),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data!.length > 0
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                           return Container(
                            margin: const EdgeInsets.all(5),
                            child: LocationListItem(
                                location: snapshot.data![index], locationData: widget.locationData,)
                          );
                        }
                      )
                    : const Center(
                        child: Text('No Results',
                          style: TextStyle(
                            fontSize: 24, color: Color(0xffffffff))));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
