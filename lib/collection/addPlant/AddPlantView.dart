import 'package:flutter/material.dart';

class AddPlantView extends StatefulWidget {
  const AddPlantView({super.key});

  @override
  State<AddPlantView> createState() => _AddPlantViewState();
}

class _AddPlantViewState extends State<AddPlantView> {
  late TextEditingController nameInputController;
  late TextEditingController commentInputController;
  late TextEditingController roomInputController;

  @override
  void initState() {
    super.initState();
    nameInputController = TextEditingController();
    commentInputController = TextEditingController();
    roomInputController = TextEditingController();
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
              onSubmitted: (s) {},
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
              onSubmitted: (s) {},
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
              onSubmitted: (s) {},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Room of Plant"),
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

  /*Expanded(
  child: OutlinedButton(
  onPressed: () {}, //pop sheet with search function
  style: OutlinedButton.styleFrom(
  foregroundColor: Theme.of(context).colorScheme.secondary,
  shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)))),
  child: const Text(
  "Plant Species",
  textAlign: TextAlign.left,
  ),
  ))*/

  void Done() {
    Navigator.pop(context);
  }
}
