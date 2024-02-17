import 'package:tsengarden/models/ownedPlant.dart';
import 'package:tsengarden/models/plant.dart';

class SharedData {
  List<OwnedPlant> ownedPlants;

  SharedData({required this.ownedPlants});

  SharedData.empty() : ownedPlants = [];

  SharedData.mock() : ownedPlants = []{
    for (int i = 0; i < 10; i++) {
      ownedPlants.add(OwnedPlant(name: "plant $i", plant: Plant(commonName: "plant $i")));
    }
  }
}
