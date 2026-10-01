import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/charger_model.dart';
import '../providers/charger_provider.dart';

class AddChargerScreen extends StatefulWidget {
  const AddChargerScreen({super.key});

  @override
  State<AddChargerScreen> createState() => _AddChargerScreenState();
}

class _AddChargerScreenState extends State<AddChargerScreen> {
  final _nameController = TextEditingController();
  final _socketController = TextEditingController();
  bool _isFastCharge = false;

  void _submit() {
    final newCharger = Charger(
      id: DateTime.now().toString(),
      name: _nameController.text,
      latitude: 37.7800, // In production, fetch via location package
      longitude: -122.4200,
      socketType: _socketController.text,
      isPrivate: false,
      isFastCharge: _isFastCharge,
    );

    context.read<ChargerProvider>().submitCharger(newCharger);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Public Station')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Station Name'),
            ),
            TextField(
              controller: _socketController,
              decoration: const InputDecoration(
                labelText: 'Socket Type (e.g., CCS2, CHAdeMO)',
              ),
            ),
            SwitchListTile(
              title: const Text('Fast Charging Support'),
              value: _isFastCharge,
              onChanged: (val) => setState(() => _isFastCharge = val),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit Station'),
            ),
          ],
        ),
      ),
    );
  }
}
