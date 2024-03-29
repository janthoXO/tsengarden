
import 'package:flutter/material.dart';
import 'package:tsengarden/wiki/wikiView.dart';

import 'collection/collectionController.dart';
import 'collection/collectionView.dart';
import 'sharedData.dart';
import 'status/statusController.dart';
import 'status/statusView.dart';


class NavBar extends StatefulWidget {
  NavBar({super.key});

  final SharedData data = SharedData.mock();

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  List<Widget> _tabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      //StatusView(statusController: StatusController(data: widget.data)),
      StatusView(statusController: StatusController(data: widget.data)),
      CollectionView(collectionController: CollectionController(data: widget.data)),
      const WikiView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: "Plant Status",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.co2),
            label: "My Plants",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Wiki",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
