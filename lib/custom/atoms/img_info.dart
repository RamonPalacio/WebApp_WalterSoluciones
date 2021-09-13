import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  final double size;
  final int color;
  const Img({Key? key, this.size = 1.0, this.color = 0xFF000000})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      widthFactor: 1,
      heightFactor: 1,
      child: SizedBox(
          // color: const Color(0xFF000000),
          height: 20,
          width: 20,
          child: CustomPaint(
            size: const Size(20, 20),
            painter: RPSCustomPainter(color),
          )),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final int color;

  RPSCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(10, 20);
    path_0.arcToPoint(const Offset(20, 10),
        radius: const Radius.elliptical(10, 10),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(const Offset(10, 20),
        radius: const Radius.elliptical(10, 10),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(2, 10.17);
    path_0.arcToPoint(const Offset(2, 10),
        radius: const Radius.elliptical(8, 8),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.close();
    path_0.moveTo(12, 15);
    path_0.lineTo(9, 15);
    path_0.lineTo(9, 11);
    path_0.lineTo(8, 11);
    path_0.lineTo(8, 9);
    path_0.lineTo(11, 9);
    path_0.lineTo(11, 13);
    path_0.lineTo(12, 13);
    path_0.close();
    path_0.moveTo(11, 7);
    path_0.lineTo(9, 7);
    path_0.lineTo(9, 5);
    path_0.lineTo(11, 5);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(color);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
