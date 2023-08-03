//Copy this CustomPainter code to the Bottom of the File
part of '../views/introduction_view.dart';

class _CenterCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width + 100, 0), Offset(0, size.height), [
      const ui.Color.fromARGB(255, 217, 211, 249).withOpacity(1),
      const Color(0xffE4F9F6).withOpacity(1)
    ], [
      0,
      1
    ]);

    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.5000000, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
