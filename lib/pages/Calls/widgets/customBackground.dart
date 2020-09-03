  
import 'package:flutter/material.dart';

class customBackground extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xFF000080);
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
    paint.color = Color(0xff2f2faf);
    var path = Path();

    path.lineTo(-300, size.height);
    path.lineTo(650,0);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}