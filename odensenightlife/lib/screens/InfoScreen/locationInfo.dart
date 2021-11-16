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

  List<IconData> _ratingIconList = [
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
  ];
  List<IconData> _pricingIconList = [
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      final args =
          ModalRoute.of(context)!.settings.arguments as LocationInfoArguments;
      setState(() {
        for (int i = 1; i <= 5; i++) {
          // Change stars to represent rating
          if (i < args.location.rating) {
            _ratingIconList[i - 1] = Icons.star;
          } else if (i - 0.5 <= args.location.rating) {
            _ratingIconList[i - 1] = Icons.star_half;
          }
          // Change stars to represent pricing rating
          if (i < args.location.pricing) {
            _pricingIconList[i - 1] = Icons.star;
          } else if (i - 0.5 <= args.location.pricing) {
            _pricingIconList[i - 1] = Icons.star_half;
          }
        }
      });
    });
  }

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
              Image.network(args.location.imageURL,
                  height: 150, width: 450, fit: BoxFit.fitWidth),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Rating:  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Icon(_ratingIconList[0],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_ratingIconList[1],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_ratingIconList[2],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_ratingIconList[3],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_ratingIconList[4],
                              color: Color(0xfffe621d), size: 30),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Pricing: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              )),
                          Icon(_pricingIconList[0],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_pricingIconList[1],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_pricingIconList[2],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_pricingIconList[3],
                              color: Color(0xfffe621d), size: 30),
                          Icon(_pricingIconList[4],
                              color: Color(0xfffe621d), size: 30),
                        ],
                      )
                    ],
                  )),
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            args.location.latitude, args.location.longitude),
                        zoom: 15.4746,
                      ),
                      markers: getmarkers(),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: ElevatedButton(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/navigationScreen',
                            arguments: NavigationScreenArguments(
                                args.location.address));
                      },
                    ),
                  )
                ],
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
