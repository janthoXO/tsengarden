import 'package:tsengarden/models/plant.dart';

class OwnedPlant{
  static int lastId = 0;
  static const String defaultRoom = "No Room";
  static const String defaultComment = "";


  int id = lastId + 1;
  String name;
  String room;
  String comment;
  DateTime lastWatered;
  Plant plant;

  OwnedPlant({this.name = "", plant, lastWatered, this.room = defaultRoom, this.comment = defaultComment}):
    lastWatered = lastWatered ?? DateTime.now(),
    plant = plant ?? Plant();

  void sanitize(){
    name.trimRight();
    if(name.isEmpty){
      name = "Plant$id";
    }

    room.trimRight();
    if(room.isEmpty){
      room = defaultRoom;
    }

    comment.trimRight();
    if(comment.isEmpty){
      comment = defaultComment;
    }
  }

}
