import 'package:tsengarden/models/ownedPlant.dart';
import 'package:flutter/material.dart';

class NeedWaterElement extends StatefulWidget {
  final OwnedPlant ownedPlant;

  const NeedWaterElement({super.key, required this.ownedPlant});

  @override
  State<NeedWaterElement> createState() => _NeedWaterElementState();
}

class _NeedWaterElementState extends State<NeedWaterElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(children: [
        Text(widget.ownedPlant.name),
        const Spacer(),
        Text(widget.ownedPlant.lastWatered.toIso8601String()),
        IconButton(onPressed: () {}, icon: const Icon(Icons.water_drop)),
      ]),
    );
  }
}
