import 'package:flutter/material.dart';

class ImgPhone extends StatelessWidget {
  final double size;
  final int color;
  const ImgPhone({Key? key, this.size = 1.0, this.color = 0xFF000000})
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
    path_0.moveTo(17.595, 21.006);
    path_0.lineTo(17.567, 21.006);
    path_0.cubicTo(13.7253, 20.9115, 10.0593, 19.3775, 7.29498, 16.708);
    path_0.cubicTo(4.6245, 13.9463, 3.08967, 10.2816, 2.99486, 6.44103);
    path_0.cubicTo(2.9892, 5.90303, 3.20044, 5.38539, 3.58098, 5.00503);
    path_0.lineTo(6.29498, 2.29303);
    path_0.cubicTo(6.68548, 1.90265, 7.31848, 1.90265, 7.70898, 2.29303);
    path_0.lineTo(11.709, 6.29303);
    path_0.cubicTo(12.0994, 6.68353, 12.0994, 7.31653, 11.709, 7.70703);
    path_0.lineTo(10.113, 9.30003);
    path_0.cubicTo(10.409, 10.406, 10.9542, 11.4294, 11.707, 12.292);
    path_0.cubicTo(12.568, 13.045, 13.5902, 13.5907, 14.695, 13.887);
    path_0.lineTo(16.295, 12.293);
    path_0.cubicTo(16.6855, 11.9026, 17.3185, 11.9026, 17.709, 12.293);
    path_0.lineTo(21.709, 16.293);
    path_0.cubicTo(22.0994, 16.6835, 22.0994, 17.3165, 21.709, 17.707);
    path_0.lineTo(18.995, 20.42);
    path_0.cubicTo(18.6249, 20.7939, 18.121, 21.0048, 17.595, 21.006);
    path_0.close();
    path_0.moveTo(6.99998, 4.41503);
    path_0.lineTo(6.99498, 4.41503);
    path_0.lineTo(4.99498, 6.41903);
    path_0.cubicTo(5.07652, 9.73769, 6.4013, 12.9047, 8.70698, 15.293);
    path_0.cubicTo(11.0954, 17.5979, 14.2618, 18.9226, 17.58, 19.005);
    path_0.lineTo(19.587, 17);
    path_0.lineTo(16.995, 14.415);
    path_0.lineTo(15.702, 15.707);
    path_0.cubicTo(15.517, 15.8941, 15.265, 15.9995, 15.002, 16);
    path_0.cubicTo(14.9317, 16.0001, 14.8617, 15.9927, 14.793, 15.978);
    path_0.cubicTo(13.1266, 15.6094, 11.5794, 14.8286, 10.293, 13.707);
    path_0.cubicTo(9.17143, 12.4206, 8.39059, 10.8734, 8.02198, 9.20703);
    path_0.cubicTo(7.95244, 8.8758, 8.05517, 8.53187, 8.29498, 8.29303);
    path_0.lineTo(9.58698, 7.00003);
    path_0.lineTo(6.99998, 4.41503);
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
