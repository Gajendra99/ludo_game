import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo_game/player%20handler/player.dart';

import 'painter_controller.dart';

class DiskPainter extends CustomPainter {
  PainterController controller;
  List playerPos;
  Color color;
  DiskPainter(
      {required this.controller, required this.playerPos, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 124, 124, 124)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    drawPlayer(
        x: playerPos[0],
        y: playerPos[1],
        fillPaint: fillPaint,
        canvas: canvas,
        color: color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawPlayer(
      {required double x,
      required double y,
      required Paint fillPaint,
      required Canvas canvas,
      required Color color}) {
    var center = Offset(x, y);
    var radius = controller.divideWidth / 2 / 2; // Radius of the circle

    final playerShadow = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.0)
      ..color = Colors.black;

    // Draw the circle
    canvas.drawCircle(center, radius, playerShadow);

    fillPaint.color = color;

    fillPaint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.0);
    canvas.drawCircle(center, radius, fillPaint);
  }
}
