class Place {
  String name;
  String id;
  String description;
  String imageURL;
  String type;
  double latitude;
  double longitude;
  String about;
  String address;
  int pricing;
  double rating;

  Place(
      this.name,
      this.id,
      this.description,
      this.imageURL,
      this.type,
      this.latitude,
      this.longitude,
      this.about,
      this.address,
      this.pricing,
      this.rating);

  Place.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        id = json['id'] as String,
        description = json['description'] as String,
        imageURL = json['imageURL'] as String,
        type = json['type'] as String,
        latitude = json['latitude'] as double,
        longitude = json['longitude'] as double,
        about = json['about'] as String,
        address = json['address'] as String,
        pricing = json['pricing'] as int,
        rating = json['rating'] as double;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'name': name,
        'id': id.toString(),
        'description': description,
        'imageURL': imageURL,
        'type': type,
        'latitude': latitude,
        'longitude': longitude,
        'about': about,
        'address': address,
        'pricing': pricing,
        'rating': rating,
      };
}
