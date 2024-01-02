import 'package:flutter/material.dart';

import 'Collection/collectionView.dart';
import 'Status/statusView.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const StatusView(),
    const CollectionView(),
  ];

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
            label: "All Plants",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );();
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}

