import 'package:flutter/material.dart';
import '../../data/place.dart';
import 'package:location/location.dart';
import '../../util/distanceCalculator.dart';


class LocationListItem extends StatefulWidget {
  final Place location;
  final LocationData locationData;

  LocationListItem({Key? key, required this.location, required this.locationData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocationListItemState();
}

class _LocationListItemState extends State<LocationListItem> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    primary: Color(0xff2EC4B6),
    minimumSize: Size(350, 170),
    padding: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );


  @override
  Widget build(BuildContext context) {
  print(widget.locationData.latitude);
  print(widget.locationData.longitude);
    return ElevatedButton(
      child: new Container(
        child: Row(children: [
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(widget.location.name,
                    style: TextStyle(
                      fontSize: 48,
                    )),
                Text(widget.location.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(calculateDistance(widget.locationData.latitude, widget.locationData.longitude, widget.location.latitude, widget.location.longitude).toStringAsFixed(1) + ' km',
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ])),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.location.imageURL,
                  height: 150, width: 150, fit: BoxFit.fitHeight))
        ]),
      ),
      style: raisedButtonStyle,
      onPressed: () {
        print(widget.location.name);
      },
    );
  }
}
