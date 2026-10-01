import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/charger_provider.dart';

class RentalScreen extends StatelessWidget {
  const RentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final privateChargers = context.watch<ChargerProvider>().privateChargers;

    return ListView.builder(
      itemCount: privateChargers.length,
      itemBuilder: (context, index) {
        final charger = privateChargers[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(
              Icons.electrical_services,
              color: Colors.blue,
              size: 40,
            ),
            title: Text(
              charger.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Socket: ${charger.socketType}\nRate: \$${charger.hourlyRate}/hr • Hours: ${charger.availabilityHours}',
            ),
            isThreeLine: true,
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Booking request sent to ${charger.hostName}!',
                    ),
                  ),
                );
              },
              child: const Text('Book'),
            ),
          ),
        );
      },
    );
  }
}
