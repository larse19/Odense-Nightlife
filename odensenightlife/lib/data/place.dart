class Place {
  String name;
  String id;
  String description;
  String imageURL;
  String type;
  double latitude;
  double longitude;
  String about;

  Place(this.name, this.id, this.description, this.imageURL, this.type,
      this.latitude, this.longitude, this.about);

  Place.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        id = json['id'] as String,
        description = json['description'] as String,
        imageURL = json['imageURL'] as String,
        type = json['type'] as String,
        latitude = json['latitude'] as double,
        longitude = json['longitude'] as double,
        about = json['about'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'name': name,
        'id': id.toString(),
        'description': description,
        'imageURL': imageURL,
        'type': type,
        'latitude': latitude,
        'longitude': longitude,
        'about': about,
      };
}
