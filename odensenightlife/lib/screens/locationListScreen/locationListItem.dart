import 'package:flutter/material.dart';
import '../../data/place.dart';
import 'package:location/location.dart';
import '../../util/distanceCalculator.dart';
import '../../data/argumentModels.dart';

class LocationListItem extends StatefulWidget {
  final Place location;
  final LocationData locationData;

  LocationListItem(
      {Key? key, required this.location, required this.locationData})
      : super(key: key);

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
    return ElevatedButton(
      child: new Container(
        child: Row(children: [
          Flexible(
            child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(widget.location.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 30,
                    ),),
                Text(widget.location.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      calculateDistance(
                                  widget.locationData.latitude,
                                  widget.locationData.longitude,
                                  widget.location.latitude,
                                  widget.location.longitude)
                              .toStringAsFixed(1) +
                          ' km',
                      style: TextStyle(
                        fontSize: 24,
                      )),
                    Row(
                      children: [
                        Icon(Icons.star, size: 24),
                        Text(widget.location.rating.toString(), style: TextStyle(
                            fontSize: 24,
                          )), 
                        Icon(Icons.attach_money, size: 24), 
                        Text(widget.location.pricing.toString(), style: TextStyle(
                            fontSize: 24,
                        ))
                      ],)
                  ])
              ])),
          SizedBox(
            width: 10,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.location.imageURL,
                  height: 150, width: 150, fit: BoxFit.fill))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,),
      ),
      style: raisedButtonStyle,
      onPressed: () {
        Navigator.pushNamed(context, '/locationListItemInfo',
            arguments: LocationInfoArguments(widget.location));
        print(widget.location.name);
      },
    );
  }
}
