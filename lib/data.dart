import 'package:tsengarden/models/ownedPlant.dart';

class Data {
  List<OwnedPlant> ownedPlants;

  Data({required this.ownedPlants});

  Data.empty() : ownedPlants = [];

  Data.mock() : ownedPlants = []{
    for (int i = 0; i < 10; i++) {
      ownedPlants.add(OwnedPlant("plant $i"));
    }
  }
}
