import 'package:flutter/material.dart';
import '../data/location.dart';
import '../data/location_dao.dart';
import 'package:firebase_database/firebase_database.dart';

class LocationListArguments {
  String type;

  LocationListArguments(this.type);
}

class LocationListItem extends StatefulWidget {
  final Location location;
  final locationDao = LocationDao();

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

  void _saveLocationTest() {
    final Location location = widget.location;
    widget.locationDao.saveLocation(location);
  }

  void _getLocationTest(String type) {
    widget.locationDao.getLocations(type);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: new Container(
        child: Row(children: [
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(widget.location.name,
                    style: TextStyle(
                      fontSize: 48,
                    )),
                Text(widget.location.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(widget.location.distance,
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ])),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.location.imageURL,
                  height: 150, width: 150, fit: BoxFit.fitHeight))
        ]),
      ),
      style: raisedButtonStyle,
      onPressed: () {
        _getLocationTest("bar");
      },
    );
  }
}

class LocationList extends StatefulWidget {
  final List<Location> locations = [
    Location(
        "Heidis",
        '1',
        "this heidis bier bar very gud bar it is, i like to cum here and play berpong on tursdays",
        "3,2km",
        "https://www.oplevelsesgaver.dk/wondermedias/sys_master/productmedias/h15/hea/1063598-560x373.jpg",
        "bar"),
    Location(
        "A Bar",
        '2',
        "this is austrailian bar yes very gday mate",
        "3,6km",
        "https://media-cdn.tripadvisor.com/media/photo-s/12/11/4d/da/the-australian-bar.jpg",
        "bar"),
    Location(
        "Aya club",
        '3',
        "This club is for 16 year olds who are looking to smash, and do some underage drinking.",
        "4,0km",
        "https://media-cdn.tripadvisor.com/media/photo-s/12/98/ef/11/getlstd-property-photo.jpg",
        "club")
  ];
  final locationDao = LocationDao();

  @override
  State<StatefulWidget> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
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
        body: FutureBuilder<List<Location>>(
            future: widget.locationDao.getLocations(args.type),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data!.length > 0
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.all(5),
                              child: LocationListItem(
                                  location: snapshot.data![index]));
                        },
                      )
                    : const Center(child: Text('No items', style: TextStyle(fontSize: 24, color: Color(0xffffffff))));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}


/*
widget.locations.length > 0
          ? ListView.builder(
              itemCount: widget.locations.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.all(5),
                    child: LocationListItem(location: widget.locations[index]));
              },
            )
          : const Center(child: Text('No items')),
*/