import './location.dart';

class Locations {
  List<Location> locations;

  Locations(this.locations);

  Locations.fromJson(Map<dynamic, dynamic> json)
      : locations = json['locations'] as List<Location>;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{'locations': locations};
}
