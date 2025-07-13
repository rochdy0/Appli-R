class StopTime {
  final String stopId;
  final String stopName;
  final int scheduledArrival;
  final int scheduledDeparture;
  final int realtimeArrival;
  final int realtimeDeparture;
  final int arrivalDelay;
  final DateTime time;
  final int departureDelay;
  final bool timepoint;
  final bool realtime;
  final String realtimeState;
  final int serviceDay;

  StopTime({
    required this.stopId,
    required this.stopName,
    required this.scheduledArrival,
    required this.scheduledDeparture,
    required this.realtimeArrival,
    required this.realtimeDeparture,
    required this.arrivalDelay,
    required this.departureDelay,
    required this.time,
    required this.timepoint,
    required this.realtime,
    required this.realtimeState,
    required this.serviceDay,
  });

  factory StopTime.fromJson(Map<String, dynamic> json) {
    return StopTime(
      stopId: json['stopId'] as String,
      stopName: json['stopName'] as String,
      scheduledArrival: json['scheduledArrival'] as int,
      scheduledDeparture: json['scheduledDeparture'] as int,
      realtimeArrival: json['realtimeArrival'] as int,
      realtimeDeparture: json['realtimeDeparture'] as int,
      arrivalDelay: json['arrivalDelay'] as int,
      time: DateTime.fromMillisecondsSinceEpoch(((json['realtimeArrival'] as int).toInt() * 1000)+3600),
      departureDelay: json['departureDelay'] as int,
      timepoint: json['timepoint'] as bool,
      realtime: json['realtime'] as bool,
      realtimeState: json['realtimeState'] as String,
      serviceDay: json['serviceDay'] as int,
    );
  }
}
