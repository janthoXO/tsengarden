import 'package:tsengarden/sharedData.dart';
import 'package:tsengarden/models/ownedPlant.dart';
import 'package:tsengarden/models/plant.dart';

class AddPlantController{
  String? name;
  String? room;
  String? comment;
  DateTime? lastWatered;

  SharedData data;

  AddPlantController({required this.data});

  bool savePlant(){
    if(name == null){
      return false;
    }

    OwnedPlant ownedPlant = OwnedPlant(name: name!, plant: Plant(commonName: name!));

    data.ownedPlants.add(ownedPlant);
    return true;
  }

  bool savePlantPassValues(String? name){
    if(name == null || name.trim().isEmpty){
      return false;
    }

    OwnedPlant ownedPlant = OwnedPlant(name: name!, plant: Plant(commonName: name!));

    data.ownedPlants.add(ownedPlant);
    return true;
  }
}