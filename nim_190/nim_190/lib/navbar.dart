// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'produk.dart';
import 'home.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  // Handle the navigation
  void _navigationBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Pages for navigation
  final List _pages = [HomePage(), Product()];

  // Background color based on selected index
  final List<Color> _backgroundColors = [
    Colors.white, // Background color for HomePage
    const Color.fromARGB(255, 236, 106, 26) // Background color for Product
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Change background color dynamically based on selected tab
      backgroundColor: _backgroundColors[_selectedIndex],
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigationBar,
        selectedItemColor:
            const Color.fromARGB(255, 236, 106, 26), // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits), label: 'Product')
        ],
      ),
    );
  }
}
