import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/charger_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chargers = context.watch<ChargerProvider>().allChargers;

    return Stack(
      children: [
        // Placeholder for GoogleMaps or FlutterMap widget
        Container(
          color: Colors.grey[200],
          child: const Center(
            child: Text(
              'Interactive Map View\n(Replace with google_maps_flutter)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        // Mock Markers Overlay
        ...chargers.map((charger) {
          return Positioned(
            // Randomizing positions slightly for mock visualization
            top: 150 + (charger.latitude % 10 * 20),
            left: 100 + (charger.longitude.abs() % 10 * 30),
            child: Icon(
              charger.isPrivate ? Icons.home : Icons.ev_station,
              color: charger.isPrivate ? Colors.blue : Colors.green,
              size: 40,
            ),
          );
        }),
      ],
    );
  }
}
