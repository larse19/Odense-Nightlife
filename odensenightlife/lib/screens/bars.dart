import 'package:flutter/material.dart';

class Bars extends StatelessWidget {
  String dropdownvalue = "Select";
  var bartypes = ["Cheap", "Moderate", "Expensive"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bars'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton(
              color: Colors.yellow,
              //onSelected: (dropdownvalue) => onSelected(context, dropdownvalue),
              itemBuilder: (context) {
                return bartypes.map((String choice) {
                  return PopupMenuItem(
                    value: dropdownvalue,
                    child: DropdownButton(
                      value: dropdownvalue,
                      items: bartypes.map((String bartypes) {
                        return DropdownMenuItem(child: Text(bartypes));
                      }).toList(),
                    ),
                  );
                }).toList();
              })
          // Theme(
          //   data: Theme.of(context),
          //   child: PopupMenuButton<int>(
          //     color: Colors.yellow,
          //     onSelected: (item) => onSelected(context, item),
          //     itemBuilder: (context) => [
          //       PopupMenuItem<int>(
          //         value: 0,
          //         child: Text("Settings"),
          //       ),
          //       PopupMenuEntry(),
          //       PopupMenuItem<int>(
          //         enabled: true,
          //         value: 1,
          //         child: DropdownButton(
          //           value: dropdownvalue,
          //           //icon: Icon(Icons.keyboard_arrow_down),
          //           items: bartypes.map((String bartypes) {
          //             return DropdownMenuItem(
          //               value: bartypes,
          //               child: Text(bartypes),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print("item 1");
        break;
      case 1:
        print("item 2");
        break;
      case 2:
        print("item 3");
    }
  }
}
