import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ludo_game/painter/painter_controller.dart';

import '../painter/disk_painter.dart';

class Player extends StatefulWidget {
  int id;
  Color color;
  List currentPosition;
  PainterController con;
  String image;
  List playerIndex;
  List playerPath;

  Player({
    required this.id,
    required this.color,
    required this.currentPosition,
    required this.con,
    required this.image,
    required this.playerIndex,
    required this.playerPath,
  });

  @override
  _Player createState() => _Player();
}

class _Player extends State<Player> {
  // PainterController controller = Get.put(PainterController());

  @override
  Widget build(BuildContext context) {
    PainterController controller = widget.con;

    return Stack(
      children: [
        StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              children: [
                //Player Disk 1
                Positioned(
                  left: widget.currentPosition[0][0] -
                      controller.divideWidth / 2 -
                      5,
                  top:
                      widget.currentPosition[0][1] - controller.divideWidth / 2,
                  width: controller.divideWidth,
                  height: controller.divideWidth,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.currentPosition[0][0] =
                              widget.playerPath[widget.playerIndex[0]][0];
                          widget.currentPosition[0][1] =
                              widget.playerPath[widget.playerIndex[0]][1];
                          widget.playerIndex[0] += 1;
                        });
                        controller
                            .isGameUpdated(!controller.isGameUpdated.value);
                      },
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                  ),
                ),

                //Player Disk 2
                Positioned(
                  left: widget.currentPosition[1][0] -
                      controller.divideWidth / 2 -
                      2,
                  top:
                      widget.currentPosition[1][1] - controller.divideWidth / 2,
                  width: controller.divideWidth,
                  height: controller.divideWidth,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.currentPosition[1][0] =
                              widget.playerPath[widget.playerIndex[1]][0];
                          widget.currentPosition[1][1] =
                              widget.playerPath[widget.playerIndex[1]][1];
                          widget.playerIndex[1] += 1;
                        });
                        controller
                            .isGameUpdated(!controller.isGameUpdated.value);
                      },
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                  ),
                ),

                //Player 3
                Positioned(
                  left: widget.currentPosition[2][0] -
                      controller.divideWidth / 2 +
                      2,
                  top:
                      widget.currentPosition[2][1] - controller.divideWidth / 2,
                  width: controller.divideWidth,
                  height: controller.divideWidth,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.currentPosition[2][0] =
                              widget.playerPath[widget.playerIndex[2]][0];
                          widget.currentPosition[2][1] =
                              widget.playerPath[widget.playerIndex[2]][1];
                          widget.playerIndex[2] += 1;
                        });
                        controller
                            .isGameUpdated(!controller.isGameUpdated.value);
                      },
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                  ),
                ),

                //Player Disk 4
                Positioned(
                  left: widget.currentPosition[3][0] -
                      controller.divideWidth / 2 +
                      5,
                  top:
                      widget.currentPosition[3][1] - controller.divideWidth / 2,
                  width: controller.divideWidth,
                  height: controller.divideWidth,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.currentPosition[3][0] =
                              widget.playerPath[widget.playerIndex[3]][0];
                          widget.currentPosition[3][1] =
                              widget.playerPath[widget.playerIndex[3]][1];
                          widget.playerIndex[3] += 1;
                        });
                        controller
                            .isGameUpdated(!controller.isGameUpdated.value);
                      },
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
