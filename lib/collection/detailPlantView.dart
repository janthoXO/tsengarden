import 'package:flutter/material.dart';
import 'package:tsengarden/models/ownedPlant.dart';
import 'package:tsengarden/sharedData.dart';

import 'editPlant/editPlantController.dart';
import 'editPlant/editPlantView.dart';

class DetailPlantView extends StatefulWidget {
  final OwnedPlant ownedPlant;
  final SharedData data;

  const DetailPlantView(
      {super.key, required this.ownedPlant, required this.data});

  @override
  State<DetailPlantView> createState() => _DetailPlantViewState();
}

class _DetailPlantViewState extends State<DetailPlantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.ownedPlant.name),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPlantView(
                            editPlantController: EditPlantController(
                                data: widget.data,
                                ownedPlant: widget.ownedPlant)))),
                icon: const Icon(Icons.edit)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
            //image of plant
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
                    ))),

            // name of plant
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(widget.ownedPlant.name),
            ),
            // comment of plant
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(widget.ownedPlant.comment),
            ),

            // room
            // TODO make suggestion of existing rooms
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(widget.ownedPlant.room),
            ),

            // date for last watered
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child:
                  Text(widget.ownedPlant.lastWatered.toString().split(" ")[0]),
            ),
          ]),
        ));
  }
}
