import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsengarden/Status/NeedWaterElement.dart';
import 'package:tsengarden/status/statusController.dart';

import '../collection/detailPlantView.dart';
import '../collection/editPlant/editPlantView.dart';
import '../collection/editPlant/editPlantController.dart';

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
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPlantView(
                            editPlantController: EditPlantController(
                                data: widget.statusController.data)))),
                icon: const Icon(Icons.add)),
          ],
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
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
                    ]),
              )
            ];
          },

          //WaterList
          body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: widget.statusController.data.ownedPlants.length,
            itemBuilder: (BuildContext ctx, int index) {
              return ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPlantView(
                              ownedPlant: widget
                                  .statusController.data.ownedPlants[index],
                              data: widget.statusController.data,
                            ))),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(0, 75),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  padding: const EdgeInsets.all(10),
                ),
                child: Row(children: [
                  Text(widget.statusController.data.ownedPlants[index].name),
                  const Spacer(),
                  Text(
                    widget.statusController.data.ownedPlants[index].lastWatered
                        .toString()
                        .split(" ")[0],
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Icon(Icons.water_drop),
                ]),
              );
            },
            separatorBuilder: (ctx, index) =>
                const Divider(height: 10, color: Color.fromARGB(0, 0, 0, 0)),
          ),
        ));
  }
}
