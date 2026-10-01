import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http
import 'package:lol/models/cm.dart';';
import '../models/charger_model.dart';

class ChargerProvider extends ChangeNotifier {
  // Mock data for initial visualization
  final List<Charger> _chargers = [
    Charger(id: '1', name: 'City Center Station', latitude: 37.7749, longitude: -122.4194, socketType: 'CCS2', isPrivate: false, isFastCharge: true),
    Charger(id: '2', name: 'John\'s Home Charger', latitude: 37.7849, longitude: -122.4094, socketType: 'Type 2', isPrivate: true, hostName: 'John Doe', hourlyRate: 3.50, availabilityHours: '9 AM - 5 PM'),
  ];

  List<Charger> get allChargers => _chargers;
  List<Charger> get privateChargers => _chargers.where((c) => c.isPrivate).toList();
  List<Charger> get publicChargers => _chargers.where((c) => !c.isPrivate).toList();

  Future<void> submitCharger(Charger charger) async {
    // Optimistic UI update
    _chargers.add(charger);
    notifyListeners();

    // In production, replace with your actual Netlify URL
    const String apiUrl = 'https://YOUR_SITE_NAME.netlify.app/.netlify/functions/addCharger';
    
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(charger.toJson()),
      );
      if (response.statusCode != 200) {
        debugPrint('Failed to sync with backend');
      }
    } catch (e) {
      debugPrint('API Error: $e');
    }
  }
}