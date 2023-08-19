part of '../views/introduction_view.dart';

//Copy this CustomPainter code to the Bottom of the File
class _BackgroundPainterLight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.08753316, 0);
    path_0.cubicTo(size.width * 0.03918992, 0, 0, size.height * 0.03526158, 0,
        size.height * 0.07875895);
    path_0.lineTo(0, size.height * 0.9212411);
    path_0.cubicTo(0, size.height * 0.9647375, size.width * 0.03918992,
        size.height, size.width * 0.08753316, size.height);
    path_0.lineTo(size.width * 0.1856764, size.height);
    path_0.cubicTo(
        size.width * 0.2149753,
        size.height,
        size.width * 0.2381626,
        size.height * 0.9784081,
        size.width * 0.2440711,
        size.height * 0.9525871);
    path_0.cubicTo(
        size.width * 0.2684271,
        size.height * 0.8461456,
        size.width * 0.3731645,
        size.height * 0.7661098,
        size.width * 0.4986737,
        size.height * 0.7661098);
    path_0.cubicTo(
        size.width * 0.6241830,
        size.height * 0.7661098,
        size.width * 0.7289204,
        size.height * 0.8461456,
        size.width * 0.7532759,
        size.height * 0.9525871);
    path_0.cubicTo(
        size.width * 0.7591857,
        size.height * 0.9784081,
        size.width * 0.7823714,
        size.height,
        size.width * 0.8116711,
        size.height);
    path_0.lineTo(size.width * 0.9124668, size.height);
    path_0.cubicTo(size.width * 0.9608090, size.height, size.width,
        size.height * 0.9647375, size.width, size.height * 0.9212411);
    path_0.lineTo(size.width, size.height * 0.07875895);
    path_0.cubicTo(size.width, size.height * 0.03526158, size.width * 0.9608090,
        0, size.width * 0.9124668, 0);
    path_0.lineTo(size.width * 0.08753316, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width + 100, 0),
        Offset(0, size.height),
        [AppColors.darkPrimary, AppColors.darkPrimaryVariant],
        [0, 1]); //TODO CHANGE COLOR
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
