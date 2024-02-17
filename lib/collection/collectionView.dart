import 'package:flutter/material.dart';
import 'package:tsengarden/collection/addPlant/AddPlantView.dart';
import 'package:tsengarden/collection/addPlant/addPlantController.dart';
import 'package:tsengarden/collection/collectionController.dart';


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
          IconButton(onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPlantView(
                  addPlantController: AddPlantController(data: widget.collectionController.data)
              ))), icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: widget.collectionController.data.ownedPlants.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(widget.collectionController.data.ownedPlants[index].name),
          );
        },
        separatorBuilder: (ctx, index) => const Divider(),
      ),
    );
  }
}
