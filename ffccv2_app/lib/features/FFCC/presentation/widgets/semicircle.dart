import 'package:flutter/material.dart';
import 'dart:math' as math;

class SemiCirclePainter extends CustomPainter {
  final Color? color;

  const SemiCirclePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.height, size.width);
    final offset = Offset(size.width - size.width / 2, size.height);
    canvas.drawCircle(offset, radius, Paint()..color = color!);
  }

  @override
  bool shouldRepaint(SemiCirclePainter oldDelegate) {
    return color == oldDelegate.color;
  }
}
