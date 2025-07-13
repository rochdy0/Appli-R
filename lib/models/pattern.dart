import './stoptime.dart';

class Pattern {
  final String id;
  final String desc;
  final int dir;
  final String shortDesc;
  final String lastStop;
  final String lastStopName;
  final List<StopTime> times;

  Pattern({
    required this.id,
    required this.desc,
    required this.dir,
    required this.shortDesc,
    required this.lastStop,
    required this.lastStopName,
    required this.times
  });

  factory Pattern.fromJson(Map<String, dynamic> json) {
    return Pattern(
      id: json['id'] as String,
      desc: json['desc'] as String,
      dir: json['dir'] as int,
      shortDesc: json['shortDesc'] as String,
      lastStop: json['lastStop'] as String,
      lastStopName: json['lastStopName'] as String,
      times: (json['times'] as List<dynamic>? ?? [])
          .map((e) => StopTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}
