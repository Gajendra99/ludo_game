import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo_game/painter/base_painter.dart';
import 'package:ludo_game/painter/disk_painter.dart';
import 'package:ludo_game/painter/painter_controller.dart';

import 'player handler/player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(PainterController());

  @override
  Widget build(BuildContext context) {
    print('material app build');

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
                Obx(
                  () => controller.isGameUpdated.value
                      ? CustomPaint(
                          size: Size(Get.width - 16, Get.width - 16),
                          painter: BasePainter(controller: controller),
                        )
                      : CustomPaint(
                          size: Size(Get.width - 16, Get.width - 16),
                          painter: BasePainter(controller: controller),
                        ),
                ),
                Obx(() => controller.isGameUpdated.value
                    ? Player(
                        id: 1,
                        color: Colors.red,
                        currentPosition: controller.redCurrentPosition,
                        con: controller,
                        image: "assets/player/red.png",
                        playerIndex: controller.redPlayerIndex,
                        playerPath: controller.redPositions,
                      )
                    : Player(
                        id: 1,
                        color: Colors.red,
                        currentPosition: controller.redCurrentPosition,
                        con: controller,
                        image: "assets/player/red.png",
                        playerIndex: controller.redPlayerIndex,
                        playerPath: controller.redPositions,
                      )),

                //Green Player
                Obx(() => controller.isGameUpdated.value
                    ? Player(
                        id: 1,
                        color: Colors.green,
                        currentPosition: controller.greenCurrentPosition,
                        con: controller,
                        image: "assets/player/green.png",
                        playerIndex: controller.greenPlayerIndex,
                        playerPath: controller.greenPositions,
                      )
                    : Player(
                        id: 1,
                        color: Colors.green,
                        currentPosition: controller.greenCurrentPosition,
                        con: controller,
                        image: "assets/player/green.png",
                        playerIndex: controller.greenPlayerIndex,
                        playerPath: controller.greenPositions,
                      )),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('pressed');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
