import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo_game/painter/base_painter.dart';
import 'package:ludo_game/painter/disk_painter.dart';
import 'package:ludo_game/painter/painter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    PainterController controller = Get.put(PainterController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Draw Rectangle in Flutter'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(Get.width - 16,
                      Get.width - 16), // Size of the drawing area
                  painter: BasePainter(controller: controller),
                ),
                CustomPaint(
                  size: Size(Get.width - 16,
                      Get.width - 16), // Size of the drawing area
                  painter: DiskPainter(controller: controller),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FAB Pressed');
            print('${controller.divideWidth}');
            setState(() {
              print('${controller.redPositions}');
              controller.redPlayerPos[0][0] =
                  controller.redPositions[controller.redPlayerIndex][0];
              controller.redPlayerPos[0][1] =
                  controller.redPositions[controller.redPlayerIndex][1];
              controller.redPlayerIndex += 1;
              print('${controller.redPlayerIndex}');
              print(
                  "================================================================");
              print('${controller.redPlayerPos}');
              print(
                  "================================================================");
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue, // Customize FAB background color
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked, // Position the FAB
      ),
    );
  }
}
