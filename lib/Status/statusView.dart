import 'package:flutter/material.dart';
import 'package:tsengarden/Collection/AddPlant/AddPlantView.dart';
import 'package:tsengarden/Status/NeedWaterElement.dart';
import 'package:tsengarden/models/ownedPlant.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  final WaterButton = Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
    IconButton.filled(
        onPressed: () {},
        iconSize: 50,
        padding: const EdgeInsets.all(10),
        icon: const Icon(Icons.water_drop),
        style: IconButton.styleFrom(backgroundColor: Colors.lightBlue)),
    const Text("Driest Plant"),
            const Text("Overdue xxx days"),
  ]));

  final WaterList = Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 1,
          itemBuilder: (BuildContext ctx, int index) {
            return NeedWaterElement(ownedPlant: OwnedPlant("filler"));
          }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: callAddPlant, icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(
          children: [
            WaterButton,
            WaterList,
          ],
        ));
  }

  void callAddPlant() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddPlantView()));
  }
}
