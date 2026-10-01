import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'add_charger_screen.dart';
import 'to_let_screen.dart';
import 'rental_screen.dart';
import 'profile_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ToLetScreen(),
    const RentalScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EV Connect',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: _currentIndex == 0
            ? [
                IconButton(
                  icon: const Icon(Icons.add_location_alt),
                  tooltip: 'Add Nearby Station',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddChargerScreen(),
                      ),
                    );
                  },
                ),
              ]
            : null,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.ev_station),
            label: 'To-Let',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Rent'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
