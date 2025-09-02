import 'package:drift/drift.dart';

class Agency extends Table {
  TextColumn get agencyId => text()();
  TextColumn get agencyName => text()();
  TextColumn get agencyUrl => text()();
  TextColumn get agencyTimezone => text()();
  TextColumn get agencyLang => text()();
  IntColumn get agencyPhone => integer()();
}

/* class BookingRules extends Table {
  IntColumn get bookingRuleId => integer()();
  TextColumn get bookingType => text()();
  TextColumn get priorNoticeDurationMin => text()();
} */

class CalendarDates extends Table {
  TextColumn get serviceId => text()();
  IntColumn get date => integer()();
  IntColumn get exceptionType => integer()();
}

/* class Calendar extends Table {} */

class FareAttributes extends Table {
  TextColumn get fareId => text()();
  IntColumn get price => integer()();
  TextColumn get currencyType => text()();
  IntColumn get paymentMethod => integer()();
  TextColumn get transfers => text()();
  IntColumn get transferDuration => integer()();
}

/* class FareRules extends Table {} */

/* class FeedInfo extends Table {} */

/* class Frequencies extends Table {} */

class Routes extends Table {
  TextColumn get agencyId => text()();
  TextColumn get routeId => text()();
  TextColumn get networkId => text()();
  TextColumn get routeShortName => text()();
  TextColumn get routeLongName => text()();
  IntColumn get routeType => integer()();
  TextColumn get routeColor => text()();
  TextColumn get routeTextColor => text()();
}

class Shapes extends Table {
  TextColumn get shapeId => text()();
  RealColumn get shapePtLat => real()();
  RealColumn get shapePtLon => real()();
  IntColumn get shapePtSequence => integer()();
  RealColumn get shapeDistTraveled => real()();
}

class StopTimes extends Table {
  IntColumn get tripId => integer()();
  TextColumn get stopId => text()();
  TextColumn get arrivalTime => text()();
  TextColumn get departureTime => text()();
  IntColumn get stopSequence => integer()();
  IntColumn get pickupType => integer()();
  TextColumn get pickupBookingRuleId => text().nullable()();
}

class Stops extends Table {
  TextColumn get stopId => text()();
  TextColumn get stopCode => text()();
  TextColumn get stopName => text()();
  RealColumn get stopLat => real()();
  RealColumn get stopLon => real()();
  TextColumn get zoneId => text().nullable()();
  TextColumn get locationType => text().nullable()();
  TextColumn get parentStation => text().nullable()();
  IntColumn get wheelchairBoarding => integer()();
}

/* class Transfers extends Table {} */

class Trips extends Table {
  TextColumn get routeId => text()/* .references(Routes, #routeId) */();
  IntColumn get tripId => integer()();
  TextColumn get tripHeadsign => text()();
  TextColumn get serviceId => text()/* .references(CalendarDates, #serviceId) */();
  IntColumn get directionId => integer()();
  TextColumn get shapeId => text().nullable()/* .references(Shapes, #shapeId) */();
  IntColumn get wheelchairAccessible => integer()();
  IntColumn get bikesAllowed => integer()();
}