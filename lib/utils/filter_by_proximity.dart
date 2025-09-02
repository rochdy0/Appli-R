Iterable<T> filterByProximity<T>({
  required Iterable<T> items,
  required double Function(T) getLat,
  required double Function(T) getLon,
  required double centerLat,
  required double centerLon,
  required int maxDistanceMeters,
}) {
  const metersPerDegree = 111_000.0;
  final delta = maxDistanceMeters / metersPerDegree;

  final minLat = centerLat - delta;
  final maxLat = centerLat + delta;
  final minLon = centerLon - delta;
  final maxLon = centerLon + delta;

  return items.where((item) {
    final lat = getLat(item);
    final lon = getLon(item);
    return lat > minLat &&
           lat < maxLat &&
           lon > minLon &&
           lon < maxLon;
  });
}
