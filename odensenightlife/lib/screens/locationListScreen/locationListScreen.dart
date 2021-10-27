import 'package:flutter/material.dart';
import './locationList.dart';
import '../../data/argumentModels.dart';

class LocationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as LocationListArguments;

    return Scaffold(
        backgroundColor: Color(0xff385f71),
        appBar: AppBar(
          title: Text(args.type),
          backgroundColor: new Color(0xff2ec4b6),
        ),
        body: LocationList(type: args.type));
  }
}
