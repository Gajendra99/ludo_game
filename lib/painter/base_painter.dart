import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'painter_controller.dart';

class BasePainter extends CustomPainter {
  PainterController controller;
  BasePainter({required this.controller});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 124, 124, 124)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    final rect2 = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.width));

    canvas.drawRect(rect2, paint);

    //Declering list for path with their x,y points
    for (int i = 0; i < controller.redPath.length; i++) {
      controller.redPositions.add([0.0, 1.0]);
    }

    //Drawing Game Board
    gameBoard(canvas, fillPaint, paint);

    //Drawing Red Home
    var point1 = Offset(controller.startPoint, controller.startPoint);
    var point2 = Offset(controller.startPoint,
        controller.startPoint + (controller.divideWidth * 3));
    var point3 = Offset(
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth,
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth);

    lastBase(
        canvas: canvas,
        fillPaint: fillPaint,
        paint: paint,
        point1: point1,
        point2: point2,
        point3: point3,
        color: Colors.red);

    //Drawing green home
    point1 = Offset(controller.startPoint, controller.startPoint);
    point2 = Offset(controller.startPoint + (controller.divideWidth * 3),
        controller.startPoint);
    point3 = Offset(
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth,
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth);

    lastBase(
        canvas: canvas,
        fillPaint: fillPaint,
        paint: paint,
        point1: point1,
        point2: point2,
        point3: point3,
        color: Colors.green);

    //drawing Blue Home
    point1 = Offset(controller.startPoint + (controller.divideWidth * 3),
        controller.startPoint + (controller.divideWidth * 3));
    point2 = Offset(controller.startPoint + (controller.divideWidth * 3),
        controller.startPoint);
    point3 = Offset(
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth,
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth);

    lastBase(
        canvas: canvas,
        fillPaint: fillPaint,
        paint: paint,
        point1: point1,
        point2: point2,
        point3: point3,
        color: Colors.blue);

    //drawing yellow home
    point1 = Offset(controller.startPoint,
        controller.startPoint + (controller.divideWidth * 3));
    point2 = Offset(controller.startPoint + (controller.divideWidth * 3),
        controller.startPoint + (controller.divideWidth * 3));
    point3 = Offset(
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth,
        controller.startPoint +
            (controller.divideWidth / 2) +
            controller.divideWidth);

    lastBase(
        canvas: canvas,
        fillPaint: fillPaint,
        paint: paint,
        point1: point1,
        point2: point2,
        point3: point3,
        color: Colors.yellow);

    //Drawing Home bases ofeach color

    //Home Base Desiging - UI
    homeBases(canvas: canvas, fillPaint: fillPaint, size: size);
    //First moving pointcircle
    fillPaint.color = Color.fromARGB(255, 0, 0, 0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void gameBoard(Canvas canvas, Paint fillPaint, Paint paint) {
    print('${controller.redPath}');
    for (int i = 0; i < 15; i++) {
      for (int j = 0; j < 15; j++) {
        //Storing moving path cordinates for player
        print('${controller.data[i][j]}');
        if (controller.redPath.contains(controller.data[i][j])) {
          controller.addRedPositions(i: i, j: j);
        }
        //Drawing moving paths for players
        if (controller.data[i][j] > 0 &&
            !controller.rejectedBorder.contains(controller.data[i][j])) {
          if (controller.redCol.contains(controller.data[i][j]) == true) {
            fillPaint.color = Colors.red;
          } else if (controller.greenCol.contains(controller.data[i][j]) ==
              true) {
            fillPaint.color = Colors.green;
          } else if (controller.blueCol.contains(controller.data[i][j]) ==
              true) {
            fillPaint.color = Colors.blue;
          } else if (controller.yellowCol.contains(controller.data[i][j]) ==
              true) {
            fillPaint.color = Colors.yellow;
          } else {
            fillPaint.color = Colors.transparent;
          }
          final rect = Rect.fromPoints(
              Offset(j * controller.divideWidth, i * controller.divideWidth),
              Offset(controller.divideWidth * j + controller.divideWidth,
                  i * controller.divideWidth + controller.divideWidth));

          canvas.drawRect(rect, fillPaint);
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  lastBase(
      {required var point1,
      required var point2,
      required var point3,
      required Paint fillPaint,
      required Paint paint,
      required Canvas canvas,
      required Color color}) {
    var path = Path()
      ..moveTo(point1.dx, point1.dy)
      ..lineTo(point2.dx, point2.dy)
      ..lineTo(point3.dx, point3.dy)
      ..close();
    fillPaint.color = color;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);
  }

  //Home Base UI - The colored big Square
  homeBases(
      {required Paint fillPaint, required Canvas canvas, required Size size}) {
    //Red Home
    buildBaseUI(
        fillPaint: fillPaint,
        canvas: canvas,
        size: size,
        color: Colors.red,
        x1: 0,
        x2: 0,
        y1: controller.divideWidth * 6,
        y2: controller.divideWidth * 6);

    //Green home

    buildBaseUI(
        fillPaint: fillPaint,
        canvas: canvas,
        size: size,
        color: Colors.green,
        x1: controller.divideWidth * 9,
        x2: 0,
        y1: size.width,
        y2: controller.divideWidth * 6);

    //Blue home

    buildBaseUI(
        fillPaint: fillPaint,
        canvas: canvas,
        size: size,
        color: Colors.blue,
        x1: controller.divideWidth * 9,
        x2: controller.divideWidth * 9,
        y1: size.width,
        y2: size.height);

    //Yellow Home

    buildBaseUI(
        fillPaint: fillPaint,
        canvas: canvas,
        size: size,
        color: Colors.yellow,
        x1: 0,
        x2: controller.divideWidth * 9,
        y1: controller.divideWidth * 6,
        y2: size.height);
  }

  buildBaseUI(
      {required Paint fillPaint,
      required Canvas canvas,
      required Size size,
      required Color color,
      required double x1,
      required double x2,
      required double y1,
      required double y2}) {
    var rect3 = Rect.fromPoints(Offset(x1, x2), Offset(y1, y2));
    fillPaint.color = color;
    canvas.drawRect(rect3, fillPaint);

    rect3 = Rect.fromPoints(
        Offset(
            x1 + controller.divideWidth / 2, x2 + controller.divideWidth / 2),
        Offset(
            y1 - controller.divideWidth / 2, y2 - controller.divideWidth / 2));
    fillPaint.color = Color.fromARGB(216, 255, 255, 255);
    canvas.drawRect(rect3, fillPaint);
  }
}
