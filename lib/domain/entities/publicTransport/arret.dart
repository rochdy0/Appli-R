class Arret {
  final String code;
  final String city;
  final String name;
  final double lat;
  final double lon;

  Arret({
    required this.code,
    required this.city,
    required this.name,
    required this.lat,
    required this.lon,
  });

/*   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Arret &&
          city == other.city &&
          name == other.name &&
          lat == other.lat &&
          lon == other.lon;

  @override
  int get hashCode =>
      city.hashCode ^
      name.hashCode ^
      lat.hashCode ^
      lon.hashCode; */
}
