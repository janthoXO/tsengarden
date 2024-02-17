import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsengarden/collection/addPlant/addPlantController.dart';

class AddPlantView extends StatefulWidget {
  final AddPlantController addPlantController;

  const AddPlantView({super.key, required this.addPlantController});

  @override
  State<AddPlantView> createState() => _AddPlantViewState();
}

class _AddPlantViewState extends State<AddPlantView> {
  late TextEditingController nameInputController;
  late TextEditingController commentInputController;
  late TextEditingController roomInputController;
  late TextEditingController lastWateredInputController;

  @override
  void initState() {
    super.initState();
    nameInputController = TextEditingController();
    commentInputController = TextEditingController();
    roomInputController = TextEditingController();
    lastWateredInputController = TextEditingController();
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
                    then((value) => lastWateredInputController.text = value != null ? value.toString().split(" ")[0] : lastWateredInputController.text)
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
    if(widget.addPlantController.savePlantPassValues(nameInputController.text)) {
      Navigator.pop(context);
    }

    
  }
}
