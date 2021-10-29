import 'package:flutter/material.dart';
import '../locationListScreen/locationList.dart';
import '../../data/argumentModels.dart';

class LocationInfo extends StatelessWidget {
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
        body: Container(
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
          ],
        )));
  }
}
