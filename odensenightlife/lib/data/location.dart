class Location {
  String name;
  String id;
  String description;
  String distance;
  String imageURL;
  String type;

  Location(this.name, this.id, this.description, this.distance, this.imageURL,
      this.type);

  Location.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        id = json['id'] as String,
        description = json['description'] as String,
        distance = json['distance'] as String,
        imageURL = json['imageURL'] as String,
        type = json['type'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'name': name,
        'id': id.toString(),
        'description': description,
        'distance': distance,
        'imageURL': imageURL,
        'type': type,
      };
}
