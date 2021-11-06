import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:odensenightlife/data/place.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
  final Place location;
  final LocationData locationData;

  MapScreen({Key? key, required this.location, required this.locationData})
      : super(key: key);
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(55.39462332641292, 10.381433095192778),
    zoom: 14.4746,
  );

  late Marker _origin;
  late Marker _destination;
  Directions _info;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: _initialCameraPosition,
        markers: _addMarkers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        polylines: {
          if (_info != null)
            Polyline(
              polylineId: const PolylineId('overview_polyline'),
              color: Colors.red,
              width: 5,
              points: _info.polylinePoints
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList(),
              ),
            },
      ),
    );
  }

  void _addMarkers(LatLng pos) async {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );

        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }
  /* Set<Marker> addMarkers(lat1, lon1, lat2, lon2) {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add second marker
        markerId: MarkerId("You"),
        position: LatLng(lat1, lon1), //position of marker
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        //add second marker
        markerId: MarkerId("destination"),
        position: LatLng(lat2, lon2), //position of marker
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan), //Icon for Marker
      ));
    });
    return markers;
  } */
}
