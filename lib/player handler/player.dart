class Player {
  int id;
  String name;
  Disk disk1;
  Disk disk2;
  Disk disk3;
  Disk disk4;

  Player(
      {required this.id,
      required this.name,
      required this.disk1,
      required this.disk2,
      required this.disk3,
      required this.disk4});
}

class Disk {
  int id;
  double positionX;
  double positionY;

  Disk({required this.id, required this.positionX, required this.positionY});
}
