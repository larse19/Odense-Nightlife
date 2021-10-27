import 'package:flutter/material.dart';
import '../../data/location.dart';

class LocationListItem extends StatefulWidget {
  final Location location;

  LocationListItem({Key? key, required this.location}) : super(key: key);

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
                Text(widget.location.distance,
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