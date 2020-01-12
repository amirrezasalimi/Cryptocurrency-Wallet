import 'package:flutter/material.dart';

class CurrencyChart extends CustomPainter {
  List<double> data;
  Color color;
  CurrencyChart({this.data, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    LinearGradient g = new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [this.color.withOpacity(0.2), this.color.withOpacity(0.7)]);
    Paint line = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..color = this.color
      ..shader = g.createShader(
          Rect.fromPoints(Offset(0.0, 0.0), Offset(size.width, 0.0)));

    Path p = Path();
    int i = 0;
    double marginSides = 0.5;
    double _size = ((size.width - (marginSides * 2)) / this.data.length);
    double areaHeight = size.height - 10;
    Offset startOffset = Offset((i * _size), areaHeight - (this.data[0]));
    p.moveTo(startOffset.dx, startOffset.dy);
    this.data.forEach((v) {
      double item = this.data[i];
      Offset of = Offset(((i + 1) * _size), areaHeight - (item));
      if (i != 0) {
        p.lineTo(of.dx, of.dy);
      }
      i++;
    });
    canvas.translate(marginSides, 0);
    canvas.drawPath(p, line);
    var shadow = p;
    canvas.translate(0, 5);
    canvas.drawPath(
        shadow,
        Paint()
          ..color = color.withOpacity(0.6)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3));
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
