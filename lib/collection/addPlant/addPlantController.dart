import 'package:tsengarden/sharedData.dart';
import 'package:tsengarden/models/ownedPlant.dart';
import 'package:tsengarden/models/plant.dart';

class AddPlantController{
  OwnedPlant ownedPlant;

  SharedData data;

  AddPlantController({required this.data}):
  ownedPlant = OwnedPlant();

  bool savePlant(){
    if(ownedPlant.name.isEmpty){
      return false;
    }

    ownedPlant.sanitize();
    data.ownedPlants.add(ownedPlant);
    return true;
  }
}