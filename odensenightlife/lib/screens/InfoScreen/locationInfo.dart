import 'dart:async';
import 'package:flutter/material.dart';
import '../../data/argumentModels.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class LocationInfo extends StatefulWidget {
  static final CameraPosition _MapOfDenmark = CameraPosition(
    target: LatLng(55.39462332641292, 10.381433095192778),
    zoom: 15.4746,
  );

  @override
  _LocationInfoState createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = new Set();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as LocationInfoArguments;

    return Scaffold(
        backgroundColor: Color(0xff2EC4B6),
        appBar: AppBar(
          title: Text(args.location.name),
          backgroundColor: new Color(0xff2ec4b6),
        ),
        body: ListView(
          children: [
            Column(children: <Widget>[
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(args.location.imageURL,
                      height: 150, width: 450, fit: BoxFit.fitWidth),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    args.location.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    args.location.about,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pricing: Totally student friendly",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Rating: Pretty gut",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: LocationInfo._MapOfDenmark,
                  markers: getmarkers(),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ]),
          ],
        ));
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add second marker
        markerId: MarkerId("Heidis"),
        position:
            LatLng(55.39462332641292, 10.381433095192778), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Heidis',
          snippet: 'Pls drink',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return markers;
  }
}
