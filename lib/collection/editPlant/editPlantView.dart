import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'editPlantController.dart';

class EditPlantView extends StatefulWidget {
  final EditPlantController editPlantController;

  const EditPlantView({super.key, required this.editPlantController});

  @override
  State<EditPlantView> createState() => _EditPlantViewState();
}

class _EditPlantViewState extends State<EditPlantView> {
  late TextEditingController nameInputController;
  late TextEditingController commentInputController;
  late TextEditingController roomInputController;
  late TextEditingController lastWateredInputController;

  @override
  void initState() {
    super.initState();
    EditPlantController controller = widget.editPlantController;
    nameInputController = TextEditingController(text: controller.ownedPlant.name);
    commentInputController = TextEditingController(text: controller.ownedPlant.comment);
    roomInputController = TextEditingController(text: controller.ownedPlant.room);
    lastWateredInputController = TextEditingController(text: controller.ownedPlant.lastWatered.toString().split(" ")[0]);
  }

  @override
  void dispose() {
    nameInputController.dispose();
    commentInputController.dispose();
    roomInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: Done, icon: const Icon(Icons.done))],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          //image of plant
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: Container(),
                  ))),

          // name of plant
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameInputController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]+.*'))],
              onChanged: (name){widget.editPlantController.ownedPlant.name = name;},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Name of Plant"),
            ),
          ),

          // comment of plant
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: commentInputController,
              onChanged: (comment){widget.editPlantController.ownedPlant.comment = comment;},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Comment for Plant"),
            ),
          ),

          // room
          // TODO make suggestion of existing rooms
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: roomInputController,
              onChanged: (room){widget.editPlantController.ownedPlant.room = room;},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Room of Plant"),
            ),
          ),

              // date for last watered
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: lastWateredInputController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Date Last Watered",
                    suffixIcon: Icon(Icons.calendar_month)
                  ),
                  readOnly: true,
                  onTap: () => {
                    showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(const Duration(days: 30)),
                        lastDate: DateTime.now().add(const Duration(days: 30))).
                    then((value) {
                      widget.editPlantController.ownedPlant.lastWatered = value ?? widget.editPlantController.ownedPlant.lastWatered;
                      lastWateredInputController.text = value != null ? value.toString().split(" ")[0] : lastWateredInputController.text;})
                  },
                ),
              ),

          //plant species
          // either select from API or adjust manually
          Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(children: [
                TextField(
                  onTap: () {}, //pop sheet with search function
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Plant Species"),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {}, // remove search field -> instead display manual options
                        icon: const Icon(Icons.tune),
                    )
                )
              ]))
        ])));
  }

  void Done() {
    if(widget.editPlantController.savePlant()) {
        Navigator.pop(context);
    }
  }
}
