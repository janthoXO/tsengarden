import 'package:tsengarden/models/plant.dart';

class OwnedPlant{
  String name;
  String? room;
  String? comment;
  DateTime lastWatered;
  Plant plant;

  OwnedPlant(this.name):
    lastWatered = DateTime.now(),
    plant = Plant(name: name);

}
