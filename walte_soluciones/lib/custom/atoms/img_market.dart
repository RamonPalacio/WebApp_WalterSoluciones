import 'package:flutter/material.dart';

class ImgMarker extends StatelessWidget {
  final double size;
  final int color;
  const ImgMarker({Key? key, this.size = 1.0, this.color = 0xFF000000})
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
    path_0.moveTo(7, 18);
    path_0.arcToPoint(const Offset(3.5, 14.47),
        radius: const Radius.elliptical(29.18, 29.18),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.cubicTo(1.9, 12.56, 0, 9.72, 0, 7);
    path_0.arcToPoint(const Offset(14, 7),
        radius: const Radius.elliptical(7, 7),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.cubicTo(
        14, 9.72, 12.1, 12.559999999999999, 10.5, 14.469999999999999);
    path_0.arcToPoint(const Offset(7, 18),
        radius: const Radius.elliptical(29.18, 29.18),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(7, 4);
    path_0.arcToPoint(const Offset(7, 10),
        radius: const Radius.elliptical(3, 3),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(const Offset(7, 4),
        radius: const Radius.elliptical(3, 3),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(color).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
