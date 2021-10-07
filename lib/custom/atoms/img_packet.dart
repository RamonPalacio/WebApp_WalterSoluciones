import 'package:flutter/material.dart';

class ImgPacket extends StatelessWidget {
  final double size;
  final int color;
  const ImgPacket({Key? key, this.size = 1.0, this.color = 0xFF000000})
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
    path_0.moveTo(19.207, 2.57274);
    path_0.lineTo(11, 0);
    path_0.lineTo(2.79297, 2.57274);
    path_0.lineTo(0, 6.76611);
    path_0.lineTo(2.57812, 7.57643);
    path_0.lineTo(2.57812, 12.0331);
    path_0.lineTo(11, 14.6667);
    path_0.lineTo(19.4219, 12.0331);
    path_0.lineTo(19.4219, 7.57643);
    path_0.lineTo(22, 6.76611);
    path_0.lineTo(19.207, 2.57274);
    path_0.close();
    path_0.moveTo(16.7363, 3.07919);
    path_0.lineTo(11, 4.86188);
    path_0.lineTo(5.26367, 3.07919);
    path_0.lineTo(11, 1.2965);
    path_0.lineTo(16.7363, 3.07919);
    path_0.close();
    path_0.moveTo(1.97656, 6.09761);
    path_0.lineTo(3.50195, 3.80847);
    path_0.lineTo(10.0332, 5.85451);
    path_0.lineTo(8.50781, 8.14365);
    path_0.lineTo(1.97656, 6.09761);
    path_0.close();
    path_0.moveTo(3.86719, 7.96133);
    path_0.lineTo(9.04492, 9.58195);
    path_0.lineTo(10.3555, 7.61694);
    path_0.lineTo(10.3555, 13.1878);
    path_0.lineTo(3.86719, 11.1418);
    path_0.lineTo(3.86719, 7.96133);
    path_0.close();
    path_0.moveTo(11.6445, 13.1878);
    path_0.lineTo(11.6445, 7.61694);
    path_0.lineTo(12.9551, 9.58195);
    path_0.lineTo(18.1328, 7.96133);
    path_0.lineTo(18.1328, 11.1418);
    path_0.lineTo(11.6445, 13.1878);
    path_0.close();
    path_0.moveTo(13.5137, 8.14365);
    path_0.lineTo(11.9883, 5.85451);
    path_0.lineTo(18.5195, 3.80847);
    path_0.lineTo(20.0449, 6.09761);
    path_0.lineTo(13.5137, 8.14365);
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
