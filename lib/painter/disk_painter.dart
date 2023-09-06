import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo_game/player%20handler/player.dart';

import 'painter_controller.dart';

class DiskPainter extends CustomPainter {
  PainterController controller;
  DiskPainter({required this.controller});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 124, 124, 124)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    Player redPlayer = Player(
      id: 1,
      name: 'redplayer',
      disk1: Disk(
          id: 11,
          positionX: controller.redPlayerPos[0][0],
          positionY: controller.redPlayerPos[0][1]),
      disk2: Disk(
          id: 11,
          positionX: controller.redPlayerPos[1][0],
          positionY: controller.redPlayerPos[1][1]),
      disk3: Disk(
          id: 11,
          positionX: controller.redPlayerPos[2][0],
          positionY: controller.redPlayerPos[2][1]),
      disk4: Disk(
          id: 11,
          positionX: controller.redPlayerPos[3][0],
          positionY: controller.redPlayerPos[3][1]),
    );

    drawPlayer(
        x: controller.redPlayerPos[0][0],
        y: controller.redPlayerPos[0][1],
        fillPaint: fillPaint,
        canvas: canvas,
        color: Colors.red);
    drawPlayer(
        x: controller.redPlayerPos[1][0],
        y: controller.redPlayerPos[1][1],
        fillPaint: fillPaint,
        canvas: canvas,
        color: Colors.red);
    drawPlayer(
        x: controller.redPlayerPos[2][0],
        y: controller.redPlayerPos[2][1],
        fillPaint: fillPaint,
        canvas: canvas,
        color: Colors.red);
    drawPlayer(
        x: controller.redPlayerPos[3][0],
        y: controller.redPlayerPos[3][1],
        fillPaint: fillPaint,
        canvas: canvas,
        color: Colors.red);
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
