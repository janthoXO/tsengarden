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
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(children: [
        Text(widget.ownedPlant.name),
        const Spacer(),
        Text(widget.ownedPlant.lastWatered.toIso8601String(),
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.water_drop)),
      ]),
    );
  }
}
