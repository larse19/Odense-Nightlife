import 'package:flutter/material.dart';
import 'dart:math';
import 'locationList.dart';

const double buttonSize = 80;

class FlowMenu extends StatefulWidget {
  const FlowMenu({Key? key}) : super(key: key);

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;

  void _iconPressed(IconData icon) {
    if (icon == Icons.directions_walk) {
      print("Walk man");
    } else if (icon == Icons.mood) {
      print("I'm mood");
    } else if (icon == Icons.attach_money) {
      print("I'm money");
    }
  }

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
      children: <IconData>[
        Icons.mood,
        Icons.directions_walk,
        Icons.attach_money,
        Icons.sort_outlined,
      ].map<Widget>(buildItem).toList(),
    );
  }

  Widget buildItem(IconData icon) {
    return SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: FloatingActionButton(
          heroTag: icon.toString(),
          elevation: 0,
          backgroundColor: new Color(0xff2ec4b6),
          splashColor: Colors.white,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
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
