import 'package:odensenightlife/data/place.dart';

class LocationListArguments {
  String type;
  String descriptiveName;

  LocationListArguments(this.type, this.descriptiveName);
}

class LocationInfoArguments {
  Place location;

  LocationInfoArguments(this.location);
}

class NavigationScreenArguments {
  String address;

  NavigationScreenArguments(this.address);
}
