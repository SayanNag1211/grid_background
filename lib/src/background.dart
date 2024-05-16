import 'package:flutter/material.dart';

class Gridbackground extends StatelessWidget {
  final double space;
  final double? horizontallinewidth;
  final double? verticallinewidth;
  final Color color;
  const Gridbackground({
    Key? key,
    required this.space,
    this.horizontallinewidth,
    this.verticallinewidth,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _gridlines(
      space: space,
      horizontallinewidth: horizontallinewidth ?? 1,
      verticallinewidth: verticallinewidth ?? 1,
      color: color,
    );
  }
}

_gridlines(
    {double space = 30,
    Color color = Colors.black,
    Widget? child,
    double horizontallinewidth = 1,
    double verticallinewidth = 1}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;
      var h =
          Container(width: horizontallinewidth, height: height, color: color);
      var v = Container(width: width, height: verticallinewidth, color: color);
      return Stack(children: [
        ...List.generate((width / space).round(),
            (index) => Positioned(left: index * space, child: h)),
        ...List.generate((height / space).round(),
            (index) => Positioned(top: index * space, child: v)),
        if (child != null) child,
      ]);
    },
  );
}
