class LocationStatus {
  final int id;
  final double temperature;
  final double humidity;
  final double waterLevel;
  final double soilMoisture;
  final double lightIntensity;
  final double phLevel;
  final int plants;
  final String createdAt;

  LocationStatus({
    required this.id,
    required this.temperature,
    required this.humidity,
    required this.waterLevel,
    required this.soilMoisture,
    required this.lightIntensity,
    required this.phLevel,
    required this.plants,
    required this.createdAt,
  });

  factory LocationStatus.fromJson(Map<String, dynamic> json) {
    return LocationStatus(
      id: json['id'],
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      waterLevel: (json['water_level'] as num).toDouble(),
      soilMoisture: (json['soil_moisture'] as num).toDouble(),
      lightIntensity: (json['light_intensity'] as num).toDouble(),
      phLevel: (json['ph_level'] as num).toDouble(),
      plants: json['plants'],
      createdAt: json['created_at'],
    );
  }
}
