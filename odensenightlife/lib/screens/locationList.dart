import 'package:flutter/material.dart';

class Location {
  String name;
  int id;
  String description;
  String distance;
  String imageURL;
  String type;

  Location(this.name, this.id, this.description, this.distance, this.imageURL,
      this.type);
}

class LocationListArguments {
  String type;

  LocationListArguments(this.type);
}

class LocationListItem extends StatefulWidget {
  final Location location;

  LocationListItem({Key? key, required this.location}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocationListItemState();
}

class _LocationListItemState extends State<LocationListItem> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    primary: Color(0xff2EC4B6),
    minimumSize: Size(350, 170),
    padding: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: new Container(
        child: Row(children: [
          Flexible(
              child: Column(children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.location.name,
                    style: TextStyle(
                      fontSize: 48,
                    ))),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.location.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 20,
                    ))),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.location.distance,
                    style: TextStyle(
                      fontSize: 24,
                    ))),
          ])),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.location.imageURL,
                  height: 150, width: 150, fit: BoxFit.fitHeight))
        ]),
      ),
      style: raisedButtonStyle,
      onPressed: () {
        Navigator.pushNamed(context, '/locations');
      },
    );
  }
}

class LocationList extends StatelessWidget {
  final List<Location> locations = [
    Location(
        "Heidis",
        1,
        "this heidis bier bar very gud bar it is, i like to cum here and play berpong on tursdays",
        "3,2km",
        "https://www.oplevelsesgaver.dk/wondermedias/sys_master/productmedias/h15/hea/1063598-560x373.jpg",
        "bar"),
    Location(
        "A Bar",
        2,
        "this is austrailian bar yes very gday mate",
        "3,6km",
        "https://media-cdn.tripadvisor.com/media/photo-s/12/11/4d/da/the-australian-bar.jpg",
        "bar")
  ];

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
      body: locations.length > 0
          ? ListView.builder(
              itemCount: locations.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.all(5),
                    child: LocationListItem(location: locations[index]));
              },
            )
          : const Center(child: Text('No items')),
    );
  }
}
