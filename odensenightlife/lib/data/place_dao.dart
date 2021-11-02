import 'package:firebase_database/firebase_database.dart';
import 'place.dart';

class PlaceDao {
  final DatabaseReference _locationRef =
      FirebaseDatabase.instance.reference().child('locations');

  void savePlace(Place place) {
    DatabaseReference ref = _locationRef.child(place.type).push();
    place.id = ref.key;
    ref.set(place.toJson());
  }

  Future<List<Place>> getPlaces(String type) {
    return _locationRef.child(type).once().then((DataSnapshot snapshot) {
      List<Place> locationList = [];
      if (snapshot.value != null) {
        Map<dynamic, dynamic> locations = snapshot.value;
        locations.forEach((key, value) {
          locationList.add(Place.fromJson(value));
        });
      }
      return locationList;
    });
  }
}
