import 'package:firebase_database/firebase_database.dart';
import 'location.dart';

class LocationDao {
  final DatabaseReference _locationRef =
      FirebaseDatabase.instance.reference().child('locations');

  void saveLocation(Location location) {
    DatabaseReference ref = _locationRef.child(location.type).push();
    location.id = ref.key;
    ref.set(location.toJson());
  }


  Future<List<Location>> getLocations(String type) {
    return _locationRef.child(type).once().then((DataSnapshot snapshot) {
      List<Location> locationList = [];
      if (snapshot.value != null) {
        Map<dynamic, dynamic> locations = snapshot.value;
        locations.forEach((key, value) {
          locationList.add(Location.fromJson(value));
        });
      }
      return locationList;
    });
  }
}
