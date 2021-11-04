import 'package:location/location.dart';
import 'package:odensenightlife/data/place.dart';

class LocationListArguments {
  String type;

  LocationListArguments(this.type);
}

class LocationInfoArguments {
  Place location;

  LocationInfoArguments(this.location);
}
