/* class RealTimeResponseModel {
  final List<RealTimePatternModel> directions;

  RealTimeResponseModel({required this.directions});

  factory RealTimeResponseModel.fromJson(List<dynamic> json) {
    return RealTimeResponseModel(
      directions: json.map((e) => RealTimePatternModel.fromJson(e)).toList(),
    );
  }
}

class RealTimePatternModel {
  final String id;
  final String lastStopName;
  final List<HoraireRawModel> horaires;

  RealTimePatternModel({
    required this.id,
    required this.lastStopName,
    required this.horaires,
  });

  factory RealTimePatternModel.fromJson(Map<String, dynamic> json) {
    return RealTimePatternModel(
      id: json['pattern']['id'] as String,
      lastStopName: json['pattern']['lastStopName'] as String,
      horaires: (json['times'] as List)
          .map((e) => HoraireRawModel.fromJson(e))
          .toList(),
    );
  }
}

class HoraireRawModel {
  final int serviceDay;
  final int realtimeArrival;
  final bool isRealTime;

  HoraireRawModel({
    required this.serviceDay,
    required this.realtimeArrival,
    required this.isRealTime,
  });

  factory HoraireRawModel.fromJson(Map<String, dynamic> json) {
    return HoraireRawModel(
      serviceDay: json['serviceDay'] as int,
      realtimeArrival: json['realtimeArrival'] as int,
      isRealTime: json['realtime'] as bool,
    );
  }
} */

class RealTimeResponseModel {
  final List<Pattern> directions;
  final List<Horaire> horaires;

  RealTimeResponseModel({required this.directions, required this.horaires});
}

class Pattern {
  final String id; // json['pattern']['id']
  final String lastStopName; // json['pattern']['lastStopName']
  const Pattern({required this.id, required this.lastStopName});

  factory Pattern.fromJson(Map<String, dynamic> json) {
    return Pattern(
      id: json['id'] as String,
      lastStopName: json['lastStopName'] as String,
    );
  }
}

class Horaire {
  final String tripId;
  final String patternId;
  final int realtimeArrival;
  final bool isRealTime;
  const Horaire({
    required this.tripId,
    required this.patternId,
    required this.realtimeArrival,
    required this.isRealTime,
  });

    factory Horaire.fromJson(dynamic patternId, Map<String, dynamic> json) {
    return Horaire(
      patternId: patternId as String,
      tripId: json['tripId'] as String,
      realtimeArrival: json['realtimeArrival'] as int,
      isRealTime: json['realtime'] as bool,
    );
  }
}
