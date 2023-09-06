import 'package:get/get.dart';

class PainterController extends GetxController {
  double divideWidth = (Get.width - 16) / 15;
  //Starting positions of Players
  double startPoint = 6 * ((Get.width - 16) / 15);

  //Cordinated of red Path
  List redPositions = [];
  List redPlayerPos = [
    [0.0, 0.0],
    [0.0, 0.0],
    [0.0, 0.0],
    [0.0, 0.0]
  ];
  int redPlayerIndex = 0;

  @override
  void onInit() {
    super.onInit();
    //red player 1
    redPlayerPos[0][0] = divideWidth + divideWidth / 2;
    redPlayerPos[0][1] = divideWidth + divideWidth / 2;

    //red player 2
    redPlayerPos[1][0] = (divideWidth * 4) + divideWidth / 2;
    redPlayerPos[1][1] = divideWidth + divideWidth / 2;

    //red Player 3
    redPlayerPos[2][0] = divideWidth + divideWidth / 2;
    redPlayerPos[2][1] = (divideWidth * 4) + divideWidth / 2;

    //red player 4
    redPlayerPos[3][0] = (divideWidth * 4) + divideWidth / 2;
    redPlayerPos[3][1] = (divideWidth * 4) + divideWidth / 2;
  }

  var data = [
    [00, 00, 00, 00, 00, 00, 01, 02, 03, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 52, 54, 04, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 51, 55, 05, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 50, 56, 06, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 49, 57, 07, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 48, 58, 08, 00, 00, 00, 00, 00, 00],
    [42, 43, 44, 45, 46, 47, 00, 59, 00, 09, 10, 11, 12, 13, 14],
    [41, 72, 73, 74, 75, 76, 77, 00, 65, 64, 63, 62, 61, 60, 15],
    [40, 39, 38, 37, 36, 35, 00, 71, 00, 21, 20, 19, 18, 17, 16],
    [00, 00, 00, 00, 00, 00, 34, 70, 22, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 33, 69, 23, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 32, 68, 24, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 31, 67, 25, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 30, 66, 26, 00, 00, 00, 00, 00, 00],
    [00, 00, 00, 00, 00, 00, 29, 28, 27, 00, 00, 00, 00, 00, 00]
  ];
  var yellowPath = [
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    01,
    02,
    03,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    66,
    67,
    68,
    69,
    70,
    71
  ];
  var bluePath = [
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    01,
    02,
    03,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    60,
    61,
    62,
    63,
    64,
    65
  ];
  var greenPath = [
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    01,
    02,
    54,
    55,
    56,
    57,
    58,
    59
  ];

  var redPath = [
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    72,
    73,
    74,
    75,
    76,
    77
  ];

  //Home and final base colored fill path - only for UI Purpose
  var rejectedBorder = [77, 59, 65, 71];
  var redCol = [43, 72, 73, 74, 75, 76, 77];
  var greenCol = [04, 54, 55, 56, 57, 58, 59];
  var blueCol = [17, 60, 61, 62, 63, 64, 65];
  var yellowCol = [30, 66, 67, 68, 69, 70, 71];

  void addRedPositions({required int i, required int j}) {
    int index = redPath.indexOf(data[i][j]);
    redPositions[index][0] = j * divideWidth + (divideWidth / 2);
    redPositions[index][1] = i * divideWidth + (divideWidth / 2);
  }
}
