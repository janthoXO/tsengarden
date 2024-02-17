import 'package:flutter/material.dart';
import 'package:tsengarden/collection/detailPlantView.dart';

import 'collectionController.dart';
import 'editPlant/editPlantController.dart';
import 'editPlant/editPlantView.dart';

class CollectionView extends StatefulWidget {
  final CollectionController collectionController;

  const CollectionView({super.key, required this.collectionController});

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Plants"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditPlantView(
                          editPlantController: EditPlantController(
                              data: widget.collectionController.data)))),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: widget.collectionController.data.ownedPlants.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPlantView(
                          ownedPlant: widget
                              .collectionController.data.ownedPlants[index],
                          data: widget.collectionController.data,
                        ))),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 75),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              padding: const EdgeInsets.all(10),
            ),
            child: Row(children: [
              Text(widget.collectionController.data.ownedPlants[index].name),
              const Spacer()
            ]),
          );
        },
        separatorBuilder: (ctx, index) => const Divider(height: 10,color: Color.fromARGB(0,0,0,0)),
      ),
    );
  }
}
