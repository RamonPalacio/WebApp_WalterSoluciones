import 'package:flutter/material.dart';

class ImgNestIcon extends StatelessWidget {
  final double size;
  final int color;
  const ImgNestIcon({Key? key, this.size = 1.0, this.color = 0xFF000000})
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
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff909090).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.02000000, 0, size.width * 0.9600000,
                size.height),
            bottomRight: Radius.circular(size.width * 0.3200000),
            bottomLeft: Radius.circular(size.width * 0.3200000),
            topLeft: Radius.circular(size.width * 0.3200000),
            topRight: Radius.circular(size.width * 0.3200000)),
        paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(15.2803, 12.6667);
    path_1.lineTo(12.8937, 15.06);
    path_1.lineTo(13.8337, 16);
    path_1.lineTo(17.8337, 12);
    path_1.lineTo(13.8337, 8);
    path_1.lineTo(12.8937, 8.94);
    path_1.lineTo(15.2803, 11.3333);
    path_1.lineTo(7.16699, 11.3333);
    path_1.lineTo(7.16699, 12.6667);
    path_1.lineTo(15.2803, 12.6667);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
