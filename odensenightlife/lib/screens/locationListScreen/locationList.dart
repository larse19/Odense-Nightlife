import 'package:flutter/material.dart';
import '../../data/location.dart';
import '../../data/location_dao.dart';
import 'locationListItem.dart';

class LocationList extends StatefulWidget {
  final locationDao = LocationDao();
  final String type;

  LocationList({required this.type});

  @override
  State<StatefulWidget> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff385f71), 
      body: FutureBuilder<List<Location>>(
        future: widget.locationDao.getLocations(widget.type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!.length > 0
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.all(5),
                          child: LocationListItem(
                              location: snapshot.data![index]));
                    },
                  )
                : const Center(
                    child: Text('No items',
                        style: TextStyle(
                            fontSize: 24, color: Color(0xffffffff))));
          } else {
            return Center(child: CircularProgressIndicator());
          }
      }));
  }
}
