class VoiVehiculeModel {
  final double lat;
  final double lon;
  final bool isReserved;
  final bool isDisabled;
  final String vehiculeType;
  final int currentRangeMeters;
  final String rentalUri;
  final String pricingPlanId;

  VoiVehiculeModel({
    required this.lat,
    required this.lon,
    required this.isReserved,
    required this.isDisabled,
    required this.vehiculeType,
    required this.currentRangeMeters,
    required this.rentalUri,
    required this.pricingPlanId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoiVehiculeModel &&
          lat == other.lat &&
          lon == other.lon &&
          vehiculeType == other.vehiculeType &&
          rentalUri == other.rentalUri &&
          currentRangeMeters == other.currentRangeMeters;
          
  @override
  int get hashCode =>
      lat.hashCode ^
      lon.hashCode ^
      vehiculeType.hashCode ^
      rentalUri.hashCode ^
      currentRangeMeters.hashCode;

  factory VoiVehiculeModel.fromJson(Map<String, dynamic> json) {
    return VoiVehiculeModel(
      lat: (json["lat"] as num).toDouble(),
      lon: (json["lon"] as num).toDouble(),
      isReserved: json["is_reserved"] as bool,
      isDisabled: json["is_disabled"] as bool,
      vehiculeType: json["vehicle_type_id"] as String,
      currentRangeMeters: json["current_range_meters"] as int,
      rentalUri: json["rental_uris"]["android"] as String,
      pricingPlanId: json["pricing_plan_id"] as String,
    );
  }
}
