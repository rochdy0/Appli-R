class ZoneArret {
  final String id;
  final String code;
  final String city;
  final String name;
  final bool visible;
  final double lat;
  final double lon;

  ZoneArret({
    required this.id,
    required this.code,
    required this.city,
    required this.name,
    required this.visible,
    required this.lat,
    required this.lon,
  });

  // Factory constructor pour créer une instance depuis du JSON
  factory ZoneArret.fromJson(Map<String, dynamic> json) {
    return ZoneArret(
      id: json['id'] as String,
      code: json['code'] as String,
      city: json['city'] as String,
      name: json['name'] as String,
      visible: json['visible'] as bool,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }
}
