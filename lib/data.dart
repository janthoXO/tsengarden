import 'package:tsengarden/models/ownedPlant.dart';
import 'package:tsengarden/models/plant.dart';

class Data {
  List<OwnedPlant> ownedPlants;

  Data({required this.ownedPlants});

  Data.empty() : ownedPlants = [];

  Data.mock() : ownedPlants = []{
    for (int i = 0; i < 10; i++) {
      ownedPlants.add(OwnedPlant(name: "plant $i", plant: Plant(commonName: "plant $i")));
    }
  }
}
