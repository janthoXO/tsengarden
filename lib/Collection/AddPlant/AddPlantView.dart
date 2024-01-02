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
        body: Column(children: [
          //image of plant
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Container(
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
        ]));
  }

  void Done() {
    Navigator.pop(context);
  }
}
