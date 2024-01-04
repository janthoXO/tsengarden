import 'package:tsengarden/models/plant.dart';

class OwnedPlant{
  String name;
  String? room;
  String? comment;
  DateTime lastWatered;
  Plant plant;

  OwnedPlant({required this.name, required this.plant, this.room, this.comment}):
    lastWatered = DateTime.now();
}
