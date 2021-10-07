import 'package:flutter/material.dart';

class ImgCheck extends StatelessWidget {
  final double size;
  final int color;
  const ImgCheck({Key? key, this.size = 1.0, this.color = 0xFF000000})
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
    path_0.moveTo(0, 10);
    path_0.cubicTo(0, 4.4776, 4.47679, 0, 9.99919, 0);
    path_0.cubicTo(15.5216, 0, 19.9984, 4.4776, 19.9984, 10);
    path_0.cubicTo(19.9984, 15.5224, 15.5216, 20, 9.99919, 20);
    path_0.cubicTo(4.47679, 20, 0, 15.5224, 0, 10);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(color);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(9.99999, 18);
    path_1.cubicTo(5.58373, 17.9951, 2.00485, 14.4163, 2, 10);
    path_1.lineTo(2, 9.84001);
    path_1.cubicTo(2.08795, 5.44364, 5.70767, 1.94238, 10.1045, 2.00072);
    path_1.cubicTo(14.5014, 2.05906, 18.0269, 5.65512, 17.9982, 10.0523);
    path_1.cubicTo(17.9695, 14.4494, 14.3972, 17.9991, 9.99999, 18);
    path_1.close();
    path_1.moveTo(6.328, 9.67201);
    path_1.lineTo(5.2, 10.8);
    path_1.lineTo(8.39999, 14);
    path_1.lineTo(14.8, 7.60001);
    path_1.lineTo(13.672, 6.46401);
    path_1.lineTo(8.39999, 11.736);
    path_1.lineTo(6.328, 9.67201);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffFBFBFB);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
