import 'package:flutter/material.dart';

class ImgMoney extends StatelessWidget {
  final double size;
  final int color;
  const ImgMoney({Key? key, this.size = 1.0, this.color = 0xFF000000})
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
    path_0.moveTo(3, 12);
    path_0.cubicTo(3, 16.9582, 7.03364, 21, 12, 21);
    path_0.cubicTo(16.9664, 21, 21, 16.9664, 21, 12);
    path_0.cubicTo(21, 7.03364, 16.9582, 3, 12, 3);
    path_0.cubicTo(7.04182, 3, 3, 7.03364, 3, 12);
    path_0.close();
    path_0.moveTo(19.3555, 12);
    path_0.cubicTo(19.3555, 16.0582, 16.05, 19.3636, 11.9918, 19.3636);
    path_0.cubicTo(7.93364, 19.3636, 4.62818, 16.0582, 4.62818, 12);
    path_0.cubicTo(4.62818, 7.94182, 7.93364, 4.63636, 11.9918, 4.63636);
    path_0.cubicTo(16.05, 4.63636, 19.3555, 7.94182, 19.3555, 12);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(color).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(11.0182, 7.09091);
    path_1.lineTo(11.0182, 8.04818);
    path_1.cubicTo(10.0609, 8.38364, 9.38182, 9.29182, 9.38182, 10.3636);
    path_1.cubicTo(9.38182, 11.7136, 10.4864, 12.8182, 11.8364, 12.8182);
    path_1.cubicTo(12.2864, 12.8182, 12.6545, 13.1864, 12.6545, 13.6364);
    path_1.cubicTo(12.6545, 14.0864, 12.2864, 14.4545, 11.8364, 14.4545);
    path_1.cubicTo(11.4845, 14.4545, 11.1082, 14.2336, 10.7727, 13.8327);
    path_1.cubicTo(10.4782, 13.4891, 9.96273, 13.44, 9.61909, 13.7345);
    path_1.cubicTo(9.27545, 14.0291, 9.22636, 14.5445, 9.52091, 14.8882);
    path_1.cubicTo(9.95455, 15.4118, 10.47, 15.7718, 11.0182, 15.9518);
    path_1.lineTo(11.0182, 16.9091);
    path_1.cubicTo(11.0182, 17.3591, 11.3864, 17.7273, 11.8364, 17.7273);
    path_1.cubicTo(12.2864, 17.7273, 12.6545, 17.3591, 12.6545, 16.9091);
    path_1.lineTo(12.6545, 15.9518);
    path_1.cubicTo(13.6036, 15.6164, 14.2909, 14.7082, 14.2909, 13.6364);
    path_1.cubicTo(14.2909, 12.2864, 13.1864, 11.1818, 11.8364, 11.1818);
    path_1.cubicTo(11.3864, 11.1818, 11.0182, 10.8136, 11.0182, 10.3636);
    path_1.cubicTo(11.0182, 9.91364, 11.3864, 9.54545, 11.8364, 9.54545);
    path_1.cubicTo(12.1227, 9.54545, 12.4336, 9.69273, 12.72, 9.97091);
    path_1.cubicTo(13.0473, 10.2818, 13.5627, 10.2736, 13.8736, 9.95455);
    path_1.cubicTo(14.1845, 9.62727, 14.1764, 9.11182, 13.8573, 8.80091);
    path_1.cubicTo(13.44, 8.4, 13.0227, 8.17091, 12.6545, 8.04818);
    path_1.lineTo(12.6545, 7.09091);
    path_1.cubicTo(12.6545, 6.64091, 12.2864, 6.27273, 11.8364, 6.27273);
    path_1.cubicTo(11.3864, 6.27273, 11.0182, 6.64091, 11.0182, 7.09091);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Color(color);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
