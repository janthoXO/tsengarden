import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsengarden/Status/NeedWaterElement.dart';
import 'package:tsengarden/collection/addPlant/AddPlantView.dart';
import 'package:tsengarden/collection/addPlant/addPlantController.dart';
import 'package:tsengarden/status/statusController.dart';

class StatusView extends StatefulWidget {
  final StatusController statusController;

  const StatusView({super.key, required this.statusController});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPlantView(
                    addPlantController: AddPlantController(data: widget.statusController.data)
                ))),
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(
          children: [
            // WaterButton
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  IconButton.filled(
                      onPressed: () {},
                      iconSize: 100,
                      padding: const EdgeInsets.all(10),
                      icon: const Icon(Icons.water_drop),
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.lightBlue)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text(
                    "Driest Plant",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "Overdue xxx days",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ])),

            //WaterList
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(5),
                itemCount: widget.statusController.data.ownedPlants.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return NeedWaterElement(ownedPlant: widget.statusController.data.ownedPlants[index]);
                },
                separatorBuilder: (ctx, index) => const Divider(),
              ),
            ),
          ],
        ));
  }
}
