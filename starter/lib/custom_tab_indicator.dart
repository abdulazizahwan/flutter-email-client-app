import 'package:flutter/material.dart';

class RoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectangleTabIndicator(
      {required Color color,
      required double weight,
      required double width,
      required padding})
      : _painter = _RRectanglePainterColor(color, weight, width,padding);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RRectanglePainterColor extends BoxPainter {
  final Paint _paint;
  final double weight;
  final double width;
  final double padding;

  _RRectanglePainterColor(Color color, this.weight, this.width, this.padding)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    // Custom Position
    // cfg.size.width*0.5 to make it start from center
    // subtract by 7.2 to make it really center
    final Offset customOffset = offset +
        Offset(cfg.size!.width / 2 - (width * 0.5) - padding,
            cfg.size!.height - weight);

    //Custom Rectangle
    Rect myRect = customOffset & Size(width, weight);

    // Custom Rounded Rectangle
    RRect myRRect = RRect.fromRectXY(myRect, weight, weight);

    // Finally we have to draw
    canvas.drawRRect(myRRect, _paint);
  }
}
