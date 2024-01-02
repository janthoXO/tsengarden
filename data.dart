import 'package:tsengarden/models/ownedPlant.dart';

class Data {
  List<OwnedPlant> ownedPlants;

  Data.empty() : ownedPlants = [];

  Data({required this.ownedPlants});

}
