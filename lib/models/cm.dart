class Charger {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String socketType;
  final bool isPrivate;
  // Specific to Public
  final bool isFastCharge;
  // Specific to Private (To-Let)
  final String? hostName;
  final double? hourlyRate;
  final String? availabilityHours;

  Charger({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.socketType,
    required this.isPrivate,
    this.isFastCharge = false,
    this.hostName,
    this.hourlyRate,
    this.availabilityHours,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'latitude': latitude,
    'longitude': longitude,
    'socketType': socketType,
    'isPrivate': isPrivate,
    'isFastCharge': isFastCharge,
    'hostName': hostName,
    'hourlyRate': hourlyRate,
    'availabilityHours': availabilityHours,
  };
}
