import 'package:flutter/material.dart';
import './locationList.dart';
import '../../data/argumentModels.dart';
import 'package:location/location.dart';
import '../../data/place_dao.dart';
import 'flowButton.dart';

class LocationListScreen extends StatefulWidget {
  final PlaceDao placeDao = new PlaceDao();

  @override
  State<StatefulWidget> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  Location location = new Location();

  Future<LocationData> getLocation() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error('Service not enabled');
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error('Permission denied');
      }
    }

    return location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as LocationListArguments;

    return Scaffold(
      backgroundColor: Color(0xff385f71),
      appBar: AppBar(
        title: Text(args.descriptiveName),
        backgroundColor: new Color(0xff2ec4b6),
      ),
      body: FutureBuilder<LocationData>(
          future: getLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                return LocationList(
                    type: args.type, locationData: snapshot.data!);
              } else {
                return Text("Couldnt get location");
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FlowMenu(),
    );
  }
}
