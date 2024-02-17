import 'package:tsengarden/sharedData.dart';
import 'package:tsengarden/models/ownedPlant.dart';
import 'package:tsengarden/models/plant.dart';

class EditPlantController{
  OwnedPlant ownedPlant;

  SharedData data;

  EditPlantController({required this.data, ownedPlant}):
    ownedPlant = ownedPlant ?? OwnedPlant();

  bool savePlant(){
    if(ownedPlant.name.isEmpty){
      return false;
    }

    ownedPlant.sanitize();
    data.ownedPlants.add(ownedPlant);
    return true;
  }
}