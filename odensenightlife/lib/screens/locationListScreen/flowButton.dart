import 'package:flutter/material.dart';
import 'dart:math';

const double buttonSize = 80;

class FlowMenu extends StatefulWidget {
  Function callback;
  FlowMenu(this.callback, {Key? key}) : super(key: key);

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;

  changeOrderIcon(index, ascending) {
    if (ascending) {
      setState(() {
        _icons[index] = Icons.arrow_upward_sharp;
      });
    } else if (!ascending) {
      setState(() {
        _icons[index] = Icons.arrow_downward_sharp;
      });
    }
  }

  _iconPressed(IconData icon) {
    if (icon == _icons[1]) {
      _icons[0] = Icons.sort_by_alpha;
      _icons[2] = Icons.price_change_outlined;

      widget.callback("distance", changeOrderIcon, 1);

      //changeOrderIcon(1);

      print("Sorting for distance");
    } else if (icon == _icons[0]) {
      _icons[1] = Icons.directions_walk;
      _icons[2] = Icons.price_change_outlined;

      widget.callback("name", changeOrderIcon, 0);

      //changeOrderIcon(0);

      print("Sorting for name");
    } else if (icon == _icons[2]) {
      _icons[1] = Icons.directions_walk;
      _icons[0] = Icons.sort_by_alpha;

      widget.callback("pricing", changeOrderIcon, 2);

      //changeOrderIcon(2);

      print("Sorting by pricing");
    }
  }

  List<IconData> _icons = <IconData>[
    Icons.sort_by_alpha,
    Icons.directions_walk,
    Icons.price_change_outlined,
    Icons.sort_sharp,
  ];

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    menuAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children: _icons.map<Widget>(buildItem).toList(),
    );
  }

  Widget buildItem(IconData icon) {
    return SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: FloatingActionButton(
          heroTag: icon.toString(),
          elevation: 2.0,
          backgroundColor: Color(0xFFFE621D),
          splashColor: Color(0xff385f71),
          child: Icon(
            icon,
            color: Color(0xFFF6F7F8),
            size: 45,
          ),
          onPressed: () {
            _iconPressed(icon);
            if (menuAnimation.status == AnimationStatus.completed) {
              menuAnimation.reverse();
            } else {
              menuAnimation.forward();
            }
          },
        ));
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> menuAnimation;

  const FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    final n = context.childCount;

    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;

      final radius = 180 * menuAnimation.value;

      final theta = i * pi * 0.5 / (n - 2);
      final x = xStart - setValue(radius * cos(theta));
      final y = yStart - setValue(radius * sin(theta));

      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..translate(x, y, 0)
          ..translate(buttonSize / 2, buttonSize / 2)
          ..rotateZ(
              isLastItem ? 0.0 : 180 * (1 - menuAnimation.value) * pi / 180)
          ..scale(isLastItem ? 1.0 : max(menuAnimation.value, 0.5))
          ..translate(-buttonSize / 2, -buttonSize / 2),
      );
    }
  }
}
