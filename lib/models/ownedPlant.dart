import 'package:tsengarden/models/plant.dart';

class OwnedPlant{
  static int lastId = 0;

  int id;
  String name;
  String? room;
  String? comment;
  DateTime lastWatered;
  Plant plant;

  OwnedPlant({required this.name, required this.plant, this.room, this.comment}):
    id = OwnedPlant.lastId + 1,
    lastWatered = DateTime.now();
}
