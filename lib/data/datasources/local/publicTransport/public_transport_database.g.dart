// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_transport_database.dart';

// ignore_for_file: type=lint
class $AgencyTable extends Agency with TableInfo<$AgencyTable, AgencyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgencyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _agencyIdMeta = const VerificationMeta(
    'agencyId',
  );
  @override
  late final GeneratedColumn<String> agencyId = GeneratedColumn<String>(
    'agency_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agencyNameMeta = const VerificationMeta(
    'agencyName',
  );
  @override
  late final GeneratedColumn<String> agencyName = GeneratedColumn<String>(
    'agency_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agencyUrlMeta = const VerificationMeta(
    'agencyUrl',
  );
  @override
  late final GeneratedColumn<String> agencyUrl = GeneratedColumn<String>(
    'agency_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agencyTimezoneMeta = const VerificationMeta(
    'agencyTimezone',
  );
  @override
  late final GeneratedColumn<String> agencyTimezone = GeneratedColumn<String>(
    'agency_timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agencyLangMeta = const VerificationMeta(
    'agencyLang',
  );
  @override
  late final GeneratedColumn<String> agencyLang = GeneratedColumn<String>(
    'agency_lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agencyPhoneMeta = const VerificationMeta(
    'agencyPhone',
  );
  @override
  late final GeneratedColumn<int> agencyPhone = GeneratedColumn<int>(
    'agency_phone',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    agencyId,
    agencyName,
    agencyUrl,
    agencyTimezone,
    agencyLang,
    agencyPhone,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agency';
  @override
  VerificationContext validateIntegrity(
    Insertable<AgencyData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('agency_id')) {
      context.handle(
        _agencyIdMeta,
        agencyId.isAcceptableOrUnknown(data['agency_id']!, _agencyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_agencyIdMeta);
    }
    if (data.containsKey('agency_name')) {
      context.handle(
        _agencyNameMeta,
        agencyName.isAcceptableOrUnknown(data['agency_name']!, _agencyNameMeta),
      );
    } else if (isInserting) {
      context.missing(_agencyNameMeta);
    }
    if (data.containsKey('agency_url')) {
      context.handle(
        _agencyUrlMeta,
        agencyUrl.isAcceptableOrUnknown(data['agency_url']!, _agencyUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_agencyUrlMeta);
    }
    if (data.containsKey('agency_timezone')) {
      context.handle(
        _agencyTimezoneMeta,
        agencyTimezone.isAcceptableOrUnknown(
          data['agency_timezone']!,
          _agencyTimezoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_agencyTimezoneMeta);
    }
    if (data.containsKey('agency_lang')) {
      context.handle(
        _agencyLangMeta,
        agencyLang.isAcceptableOrUnknown(data['agency_lang']!, _agencyLangMeta),
      );
    } else if (isInserting) {
      context.missing(_agencyLangMeta);
    }
    if (data.containsKey('agency_phone')) {
      context.handle(
        _agencyPhoneMeta,
        agencyPhone.isAcceptableOrUnknown(
          data['agency_phone']!,
          _agencyPhoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_agencyPhoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AgencyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AgencyData(
      agencyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agency_id'],
      )!,
      agencyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agency_name'],
      )!,
      agencyUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agency_url'],
      )!,
      agencyTimezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agency_timezone'],
      )!,
      agencyLang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agency_lang'],
      )!,
      agencyPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agency_phone'],
      )!,
    );
  }

  @override
  $AgencyTable createAlias(String alias) {
    return $AgencyTable(attachedDatabase, alias);
  }
}

class AgencyData extends DataClass implements Insertable<AgencyData> {
  final String agencyId;
  final String agencyName;
  final String agencyUrl;
  final String agencyTimezone;
  final String agencyLang;
  final int agencyPhone;
  const AgencyData({
    required this.agencyId,
    required this.agencyName,
    required this.agencyUrl,
    required this.agencyTimezone,
    required this.agencyLang,
    required this.agencyPhone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['agency_id'] = Variable<String>(agencyId);
    map['agency_name'] = Variable<String>(agencyName);
    map['agency_url'] = Variable<String>(agencyUrl);
    map['agency_timezone'] = Variable<String>(agencyTimezone);
    map['agency_lang'] = Variable<String>(agencyLang);
    map['agency_phone'] = Variable<int>(agencyPhone);
    return map;
  }

  AgencyCompanion toCompanion(bool nullToAbsent) {
    return AgencyCompanion(
      agencyId: Value(agencyId),
      agencyName: Value(agencyName),
      agencyUrl: Value(agencyUrl),
      agencyTimezone: Value(agencyTimezone),
      agencyLang: Value(agencyLang),
      agencyPhone: Value(agencyPhone),
    );
  }

  factory AgencyData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AgencyData(
      agencyId: serializer.fromJson<String>(json['agencyId']),
      agencyName: serializer.fromJson<String>(json['agencyName']),
      agencyUrl: serializer.fromJson<String>(json['agencyUrl']),
      agencyTimezone: serializer.fromJson<String>(json['agencyTimezone']),
      agencyLang: serializer.fromJson<String>(json['agencyLang']),
      agencyPhone: serializer.fromJson<int>(json['agencyPhone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'agencyId': serializer.toJson<String>(agencyId),
      'agencyName': serializer.toJson<String>(agencyName),
      'agencyUrl': serializer.toJson<String>(agencyUrl),
      'agencyTimezone': serializer.toJson<String>(agencyTimezone),
      'agencyLang': serializer.toJson<String>(agencyLang),
      'agencyPhone': serializer.toJson<int>(agencyPhone),
    };
  }

  AgencyData copyWith({
    String? agencyId,
    String? agencyName,
    String? agencyUrl,
    String? agencyTimezone,
    String? agencyLang,
    int? agencyPhone,
  }) => AgencyData(
    agencyId: agencyId ?? this.agencyId,
    agencyName: agencyName ?? this.agencyName,
    agencyUrl: agencyUrl ?? this.agencyUrl,
    agencyTimezone: agencyTimezone ?? this.agencyTimezone,
    agencyLang: agencyLang ?? this.agencyLang,
    agencyPhone: agencyPhone ?? this.agencyPhone,
  );
  AgencyData copyWithCompanion(AgencyCompanion data) {
    return AgencyData(
      agencyId: data.agencyId.present ? data.agencyId.value : this.agencyId,
      agencyName: data.agencyName.present
          ? data.agencyName.value
          : this.agencyName,
      agencyUrl: data.agencyUrl.present ? data.agencyUrl.value : this.agencyUrl,
      agencyTimezone: data.agencyTimezone.present
          ? data.agencyTimezone.value
          : this.agencyTimezone,
      agencyLang: data.agencyLang.present
          ? data.agencyLang.value
          : this.agencyLang,
      agencyPhone: data.agencyPhone.present
          ? data.agencyPhone.value
          : this.agencyPhone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AgencyData(')
          ..write('agencyId: $agencyId, ')
          ..write('agencyName: $agencyName, ')
          ..write('agencyUrl: $agencyUrl, ')
          ..write('agencyTimezone: $agencyTimezone, ')
          ..write('agencyLang: $agencyLang, ')
          ..write('agencyPhone: $agencyPhone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    agencyId,
    agencyName,
    agencyUrl,
    agencyTimezone,
    agencyLang,
    agencyPhone,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgencyData &&
          other.agencyId == this.agencyId &&
          other.agencyName == this.agencyName &&
          other.agencyUrl == this.agencyUrl &&
          other.agencyTimezone == this.agencyTimezone &&
          other.agencyLang == this.agencyLang &&
          other.agencyPhone == this.agencyPhone);
}

class AgencyCompanion extends UpdateCompanion<AgencyData> {
  final Value<String> agencyId;
  final Value<String> agencyName;
  final Value<String> agencyUrl;
  final Value<String> agencyTimezone;
  final Value<String> agencyLang;
  final Value<int> agencyPhone;
  final Value<int> rowid;
  const AgencyCompanion({
    this.agencyId = const Value.absent(),
    this.agencyName = const Value.absent(),
    this.agencyUrl = const Value.absent(),
    this.agencyTimezone = const Value.absent(),
    this.agencyLang = const Value.absent(),
    this.agencyPhone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AgencyCompanion.insert({
    required String agencyId,
    required String agencyName,
    required String agencyUrl,
    required String agencyTimezone,
    required String agencyLang,
    required int agencyPhone,
    this.rowid = const Value.absent(),
  }) : agencyId = Value(agencyId),
       agencyName = Value(agencyName),
       agencyUrl = Value(agencyUrl),
       agencyTimezone = Value(agencyTimezone),
       agencyLang = Value(agencyLang),
       agencyPhone = Value(agencyPhone);
  static Insertable<AgencyData> custom({
    Expression<String>? agencyId,
    Expression<String>? agencyName,
    Expression<String>? agencyUrl,
    Expression<String>? agencyTimezone,
    Expression<String>? agencyLang,
    Expression<int>? agencyPhone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (agencyId != null) 'agency_id': agencyId,
      if (agencyName != null) 'agency_name': agencyName,
      if (agencyUrl != null) 'agency_url': agencyUrl,
      if (agencyTimezone != null) 'agency_timezone': agencyTimezone,
      if (agencyLang != null) 'agency_lang': agencyLang,
      if (agencyPhone != null) 'agency_phone': agencyPhone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AgencyCompanion copyWith({
    Value<String>? agencyId,
    Value<String>? agencyName,
    Value<String>? agencyUrl,
    Value<String>? agencyTimezone,
    Value<String>? agencyLang,
    Value<int>? agencyPhone,
    Value<int>? rowid,
  }) {
    return AgencyCompanion(
      agencyId: agencyId ?? this.agencyId,
      agencyName: agencyName ?? this.agencyName,
      agencyUrl: agencyUrl ?? this.agencyUrl,
      agencyTimezone: agencyTimezone ?? this.agencyTimezone,
      agencyLang: agencyLang ?? this.agencyLang,
      agencyPhone: agencyPhone ?? this.agencyPhone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (agencyId.present) {
      map['agency_id'] = Variable<String>(agencyId.value);
    }
    if (agencyName.present) {
      map['agency_name'] = Variable<String>(agencyName.value);
    }
    if (agencyUrl.present) {
      map['agency_url'] = Variable<String>(agencyUrl.value);
    }
    if (agencyTimezone.present) {
      map['agency_timezone'] = Variable<String>(agencyTimezone.value);
    }
    if (agencyLang.present) {
      map['agency_lang'] = Variable<String>(agencyLang.value);
    }
    if (agencyPhone.present) {
      map['agency_phone'] = Variable<int>(agencyPhone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgencyCompanion(')
          ..write('agencyId: $agencyId, ')
          ..write('agencyName: $agencyName, ')
          ..write('agencyUrl: $agencyUrl, ')
          ..write('agencyTimezone: $agencyTimezone, ')
          ..write('agencyLang: $agencyLang, ')
          ..write('agencyPhone: $agencyPhone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarDatesTable extends CalendarDates
    with TableInfo<$CalendarDatesTable, CalendarDate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarDatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serviceIdMeta = const VerificationMeta(
    'serviceId',
  );
  @override
  late final GeneratedColumn<String> serviceId = GeneratedColumn<String>(
    'service_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exceptionTypeMeta = const VerificationMeta(
    'exceptionType',
  );
  @override
  late final GeneratedColumn<int> exceptionType = GeneratedColumn<int>(
    'exception_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [serviceId, date, exceptionType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_dates';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarDate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('service_id')) {
      context.handle(
        _serviceIdMeta,
        serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('exception_type')) {
      context.handle(
        _exceptionTypeMeta,
        exceptionType.isAcceptableOrUnknown(
          data['exception_type']!,
          _exceptionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exceptionTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CalendarDate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarDate(
      serviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      exceptionType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exception_type'],
      )!,
    );
  }

  @override
  $CalendarDatesTable createAlias(String alias) {
    return $CalendarDatesTable(attachedDatabase, alias);
  }
}

class CalendarDate extends DataClass implements Insertable<CalendarDate> {
  final String serviceId;
  final int date;
  final int exceptionType;
  const CalendarDate({
    required this.serviceId,
    required this.date,
    required this.exceptionType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['service_id'] = Variable<String>(serviceId);
    map['date'] = Variable<int>(date);
    map['exception_type'] = Variable<int>(exceptionType);
    return map;
  }

  CalendarDatesCompanion toCompanion(bool nullToAbsent) {
    return CalendarDatesCompanion(
      serviceId: Value(serviceId),
      date: Value(date),
      exceptionType: Value(exceptionType),
    );
  }

  factory CalendarDate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarDate(
      serviceId: serializer.fromJson<String>(json['serviceId']),
      date: serializer.fromJson<int>(json['date']),
      exceptionType: serializer.fromJson<int>(json['exceptionType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serviceId': serializer.toJson<String>(serviceId),
      'date': serializer.toJson<int>(date),
      'exceptionType': serializer.toJson<int>(exceptionType),
    };
  }

  CalendarDate copyWith({String? serviceId, int? date, int? exceptionType}) =>
      CalendarDate(
        serviceId: serviceId ?? this.serviceId,
        date: date ?? this.date,
        exceptionType: exceptionType ?? this.exceptionType,
      );
  CalendarDate copyWithCompanion(CalendarDatesCompanion data) {
    return CalendarDate(
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      date: data.date.present ? data.date.value : this.date,
      exceptionType: data.exceptionType.present
          ? data.exceptionType.value
          : this.exceptionType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarDate(')
          ..write('serviceId: $serviceId, ')
          ..write('date: $date, ')
          ..write('exceptionType: $exceptionType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(serviceId, date, exceptionType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarDate &&
          other.serviceId == this.serviceId &&
          other.date == this.date &&
          other.exceptionType == this.exceptionType);
}

class CalendarDatesCompanion extends UpdateCompanion<CalendarDate> {
  final Value<String> serviceId;
  final Value<int> date;
  final Value<int> exceptionType;
  final Value<int> rowid;
  const CalendarDatesCompanion({
    this.serviceId = const Value.absent(),
    this.date = const Value.absent(),
    this.exceptionType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarDatesCompanion.insert({
    required String serviceId,
    required int date,
    required int exceptionType,
    this.rowid = const Value.absent(),
  }) : serviceId = Value(serviceId),
       date = Value(date),
       exceptionType = Value(exceptionType);
  static Insertable<CalendarDate> custom({
    Expression<String>? serviceId,
    Expression<int>? date,
    Expression<int>? exceptionType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serviceId != null) 'service_id': serviceId,
      if (date != null) 'date': date,
      if (exceptionType != null) 'exception_type': exceptionType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarDatesCompanion copyWith({
    Value<String>? serviceId,
    Value<int>? date,
    Value<int>? exceptionType,
    Value<int>? rowid,
  }) {
    return CalendarDatesCompanion(
      serviceId: serviceId ?? this.serviceId,
      date: date ?? this.date,
      exceptionType: exceptionType ?? this.exceptionType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serviceId.present) {
      map['service_id'] = Variable<String>(serviceId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (exceptionType.present) {
      map['exception_type'] = Variable<int>(exceptionType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarDatesCompanion(')
          ..write('serviceId: $serviceId, ')
          ..write('date: $date, ')
          ..write('exceptionType: $exceptionType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FareAttributesTable extends FareAttributes
    with TableInfo<$FareAttributesTable, FareAttribute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FareAttributesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _fareIdMeta = const VerificationMeta('fareId');
  @override
  late final GeneratedColumn<String> fareId = GeneratedColumn<String>(
    'fare_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyTypeMeta = const VerificationMeta(
    'currencyType',
  );
  @override
  late final GeneratedColumn<String> currencyType = GeneratedColumn<String>(
    'currency_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<int> paymentMethod = GeneratedColumn<int>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transfersMeta = const VerificationMeta(
    'transfers',
  );
  @override
  late final GeneratedColumn<String> transfers = GeneratedColumn<String>(
    'transfers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transferDurationMeta = const VerificationMeta(
    'transferDuration',
  );
  @override
  late final GeneratedColumn<int> transferDuration = GeneratedColumn<int>(
    'transfer_duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    fareId,
    price,
    currencyType,
    paymentMethod,
    transfers,
    transferDuration,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fare_attributes';
  @override
  VerificationContext validateIntegrity(
    Insertable<FareAttribute> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('fare_id')) {
      context.handle(
        _fareIdMeta,
        fareId.isAcceptableOrUnknown(data['fare_id']!, _fareIdMeta),
      );
    } else if (isInserting) {
      context.missing(_fareIdMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('currency_type')) {
      context.handle(
        _currencyTypeMeta,
        currencyType.isAcceptableOrUnknown(
          data['currency_type']!,
          _currencyTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyTypeMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('transfers')) {
      context.handle(
        _transfersMeta,
        transfers.isAcceptableOrUnknown(data['transfers']!, _transfersMeta),
      );
    } else if (isInserting) {
      context.missing(_transfersMeta);
    }
    if (data.containsKey('transfer_duration')) {
      context.handle(
        _transferDurationMeta,
        transferDuration.isAcceptableOrUnknown(
          data['transfer_duration']!,
          _transferDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transferDurationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FareAttribute map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FareAttribute(
      fareId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fare_id'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      currencyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_type'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_method'],
      )!,
      transfers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transfers'],
      )!,
      transferDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transfer_duration'],
      )!,
    );
  }

  @override
  $FareAttributesTable createAlias(String alias) {
    return $FareAttributesTable(attachedDatabase, alias);
  }
}

class FareAttribute extends DataClass implements Insertable<FareAttribute> {
  final String fareId;
  final int price;
  final String currencyType;
  final int paymentMethod;
  final String transfers;
  final int transferDuration;
  const FareAttribute({
    required this.fareId,
    required this.price,
    required this.currencyType,
    required this.paymentMethod,
    required this.transfers,
    required this.transferDuration,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['fare_id'] = Variable<String>(fareId);
    map['price'] = Variable<int>(price);
    map['currency_type'] = Variable<String>(currencyType);
    map['payment_method'] = Variable<int>(paymentMethod);
    map['transfers'] = Variable<String>(transfers);
    map['transfer_duration'] = Variable<int>(transferDuration);
    return map;
  }

  FareAttributesCompanion toCompanion(bool nullToAbsent) {
    return FareAttributesCompanion(
      fareId: Value(fareId),
      price: Value(price),
      currencyType: Value(currencyType),
      paymentMethod: Value(paymentMethod),
      transfers: Value(transfers),
      transferDuration: Value(transferDuration),
    );
  }

  factory FareAttribute.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FareAttribute(
      fareId: serializer.fromJson<String>(json['fareId']),
      price: serializer.fromJson<int>(json['price']),
      currencyType: serializer.fromJson<String>(json['currencyType']),
      paymentMethod: serializer.fromJson<int>(json['paymentMethod']),
      transfers: serializer.fromJson<String>(json['transfers']),
      transferDuration: serializer.fromJson<int>(json['transferDuration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fareId': serializer.toJson<String>(fareId),
      'price': serializer.toJson<int>(price),
      'currencyType': serializer.toJson<String>(currencyType),
      'paymentMethod': serializer.toJson<int>(paymentMethod),
      'transfers': serializer.toJson<String>(transfers),
      'transferDuration': serializer.toJson<int>(transferDuration),
    };
  }

  FareAttribute copyWith({
    String? fareId,
    int? price,
    String? currencyType,
    int? paymentMethod,
    String? transfers,
    int? transferDuration,
  }) => FareAttribute(
    fareId: fareId ?? this.fareId,
    price: price ?? this.price,
    currencyType: currencyType ?? this.currencyType,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    transfers: transfers ?? this.transfers,
    transferDuration: transferDuration ?? this.transferDuration,
  );
  FareAttribute copyWithCompanion(FareAttributesCompanion data) {
    return FareAttribute(
      fareId: data.fareId.present ? data.fareId.value : this.fareId,
      price: data.price.present ? data.price.value : this.price,
      currencyType: data.currencyType.present
          ? data.currencyType.value
          : this.currencyType,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      transfers: data.transfers.present ? data.transfers.value : this.transfers,
      transferDuration: data.transferDuration.present
          ? data.transferDuration.value
          : this.transferDuration,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FareAttribute(')
          ..write('fareId: $fareId, ')
          ..write('price: $price, ')
          ..write('currencyType: $currencyType, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('transfers: $transfers, ')
          ..write('transferDuration: $transferDuration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    fareId,
    price,
    currencyType,
    paymentMethod,
    transfers,
    transferDuration,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FareAttribute &&
          other.fareId == this.fareId &&
          other.price == this.price &&
          other.currencyType == this.currencyType &&
          other.paymentMethod == this.paymentMethod &&
          other.transfers == this.transfers &&
          other.transferDuration == this.transferDuration);
}

class FareAttributesCompanion extends UpdateCompanion<FareAttribute> {
  final Value<String> fareId;
  final Value<int> price;
  final Value<String> currencyType;
  final Value<int> paymentMethod;
  final Value<String> transfers;
  final Value<int> transferDuration;
  final Value<int> rowid;
  const FareAttributesCompanion({
    this.fareId = const Value.absent(),
    this.price = const Value.absent(),
    this.currencyType = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.transfers = const Value.absent(),
    this.transferDuration = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FareAttributesCompanion.insert({
    required String fareId,
    required int price,
    required String currencyType,
    required int paymentMethod,
    required String transfers,
    required int transferDuration,
    this.rowid = const Value.absent(),
  }) : fareId = Value(fareId),
       price = Value(price),
       currencyType = Value(currencyType),
       paymentMethod = Value(paymentMethod),
       transfers = Value(transfers),
       transferDuration = Value(transferDuration);
  static Insertable<FareAttribute> custom({
    Expression<String>? fareId,
    Expression<int>? price,
    Expression<String>? currencyType,
    Expression<int>? paymentMethod,
    Expression<String>? transfers,
    Expression<int>? transferDuration,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (fareId != null) 'fare_id': fareId,
      if (price != null) 'price': price,
      if (currencyType != null) 'currency_type': currencyType,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (transfers != null) 'transfers': transfers,
      if (transferDuration != null) 'transfer_duration': transferDuration,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FareAttributesCompanion copyWith({
    Value<String>? fareId,
    Value<int>? price,
    Value<String>? currencyType,
    Value<int>? paymentMethod,
    Value<String>? transfers,
    Value<int>? transferDuration,
    Value<int>? rowid,
  }) {
    return FareAttributesCompanion(
      fareId: fareId ?? this.fareId,
      price: price ?? this.price,
      currencyType: currencyType ?? this.currencyType,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transfers: transfers ?? this.transfers,
      transferDuration: transferDuration ?? this.transferDuration,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fareId.present) {
      map['fare_id'] = Variable<String>(fareId.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (currencyType.present) {
      map['currency_type'] = Variable<String>(currencyType.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<int>(paymentMethod.value);
    }
    if (transfers.present) {
      map['transfers'] = Variable<String>(transfers.value);
    }
    if (transferDuration.present) {
      map['transfer_duration'] = Variable<int>(transferDuration.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FareAttributesCompanion(')
          ..write('fareId: $fareId, ')
          ..write('price: $price, ')
          ..write('currencyType: $currencyType, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('transfers: $transfers, ')
          ..write('transferDuration: $transferDuration, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutesTable extends Routes with TableInfo<$RoutesTable, Route> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _agencyIdMeta = const VerificationMeta(
    'agencyId',
  );
  @override
  late final GeneratedColumn<String> agencyId = GeneratedColumn<String>(
    'agency_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeIdMeta = const VerificationMeta(
    'routeId',
  );
  @override
  late final GeneratedColumn<String> routeId = GeneratedColumn<String>(
    'route_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _networkIdMeta = const VerificationMeta(
    'networkId',
  );
  @override
  late final GeneratedColumn<String> networkId = GeneratedColumn<String>(
    'network_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeShortNameMeta = const VerificationMeta(
    'routeShortName',
  );
  @override
  late final GeneratedColumn<String> routeShortName = GeneratedColumn<String>(
    'route_short_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeLongNameMeta = const VerificationMeta(
    'routeLongName',
  );
  @override
  late final GeneratedColumn<String> routeLongName = GeneratedColumn<String>(
    'route_long_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeTypeMeta = const VerificationMeta(
    'routeType',
  );
  @override
  late final GeneratedColumn<int> routeType = GeneratedColumn<int>(
    'route_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeColorMeta = const VerificationMeta(
    'routeColor',
  );
  @override
  late final GeneratedColumn<String> routeColor = GeneratedColumn<String>(
    'route_color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeTextColorMeta = const VerificationMeta(
    'routeTextColor',
  );
  @override
  late final GeneratedColumn<String> routeTextColor = GeneratedColumn<String>(
    'route_text_color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    agencyId,
    routeId,
    networkId,
    routeShortName,
    routeLongName,
    routeType,
    routeColor,
    routeTextColor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Route> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('agency_id')) {
      context.handle(
        _agencyIdMeta,
        agencyId.isAcceptableOrUnknown(data['agency_id']!, _agencyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_agencyIdMeta);
    }
    if (data.containsKey('route_id')) {
      context.handle(
        _routeIdMeta,
        routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('network_id')) {
      context.handle(
        _networkIdMeta,
        networkId.isAcceptableOrUnknown(data['network_id']!, _networkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_networkIdMeta);
    }
    if (data.containsKey('route_short_name')) {
      context.handle(
        _routeShortNameMeta,
        routeShortName.isAcceptableOrUnknown(
          data['route_short_name']!,
          _routeShortNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_routeShortNameMeta);
    }
    if (data.containsKey('route_long_name')) {
      context.handle(
        _routeLongNameMeta,
        routeLongName.isAcceptableOrUnknown(
          data['route_long_name']!,
          _routeLongNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_routeLongNameMeta);
    }
    if (data.containsKey('route_type')) {
      context.handle(
        _routeTypeMeta,
        routeType.isAcceptableOrUnknown(data['route_type']!, _routeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_routeTypeMeta);
    }
    if (data.containsKey('route_color')) {
      context.handle(
        _routeColorMeta,
        routeColor.isAcceptableOrUnknown(data['route_color']!, _routeColorMeta),
      );
    } else if (isInserting) {
      context.missing(_routeColorMeta);
    }
    if (data.containsKey('route_text_color')) {
      context.handle(
        _routeTextColorMeta,
        routeTextColor.isAcceptableOrUnknown(
          data['route_text_color']!,
          _routeTextColorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_routeTextColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Route map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Route(
      agencyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agency_id'],
      )!,
      routeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_id'],
      )!,
      networkId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}network_id'],
      )!,
      routeShortName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_short_name'],
      )!,
      routeLongName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_long_name'],
      )!,
      routeType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}route_type'],
      )!,
      routeColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_color'],
      )!,
      routeTextColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_text_color'],
      )!,
    );
  }

  @override
  $RoutesTable createAlias(String alias) {
    return $RoutesTable(attachedDatabase, alias);
  }
}

class Route extends DataClass implements Insertable<Route> {
  final String agencyId;
  final String routeId;
  final String networkId;
  final String routeShortName;
  final String routeLongName;
  final int routeType;
  final String routeColor;
  final String routeTextColor;
  const Route({
    required this.agencyId,
    required this.routeId,
    required this.networkId,
    required this.routeShortName,
    required this.routeLongName,
    required this.routeType,
    required this.routeColor,
    required this.routeTextColor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['agency_id'] = Variable<String>(agencyId);
    map['route_id'] = Variable<String>(routeId);
    map['network_id'] = Variable<String>(networkId);
    map['route_short_name'] = Variable<String>(routeShortName);
    map['route_long_name'] = Variable<String>(routeLongName);
    map['route_type'] = Variable<int>(routeType);
    map['route_color'] = Variable<String>(routeColor);
    map['route_text_color'] = Variable<String>(routeTextColor);
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      agencyId: Value(agencyId),
      routeId: Value(routeId),
      networkId: Value(networkId),
      routeShortName: Value(routeShortName),
      routeLongName: Value(routeLongName),
      routeType: Value(routeType),
      routeColor: Value(routeColor),
      routeTextColor: Value(routeTextColor),
    );
  }

  factory Route.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Route(
      agencyId: serializer.fromJson<String>(json['agencyId']),
      routeId: serializer.fromJson<String>(json['routeId']),
      networkId: serializer.fromJson<String>(json['networkId']),
      routeShortName: serializer.fromJson<String>(json['routeShortName']),
      routeLongName: serializer.fromJson<String>(json['routeLongName']),
      routeType: serializer.fromJson<int>(json['routeType']),
      routeColor: serializer.fromJson<String>(json['routeColor']),
      routeTextColor: serializer.fromJson<String>(json['routeTextColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'agencyId': serializer.toJson<String>(agencyId),
      'routeId': serializer.toJson<String>(routeId),
      'networkId': serializer.toJson<String>(networkId),
      'routeShortName': serializer.toJson<String>(routeShortName),
      'routeLongName': serializer.toJson<String>(routeLongName),
      'routeType': serializer.toJson<int>(routeType),
      'routeColor': serializer.toJson<String>(routeColor),
      'routeTextColor': serializer.toJson<String>(routeTextColor),
    };
  }

  Route copyWith({
    String? agencyId,
    String? routeId,
    String? networkId,
    String? routeShortName,
    String? routeLongName,
    int? routeType,
    String? routeColor,
    String? routeTextColor,
  }) => Route(
    agencyId: agencyId ?? this.agencyId,
    routeId: routeId ?? this.routeId,
    networkId: networkId ?? this.networkId,
    routeShortName: routeShortName ?? this.routeShortName,
    routeLongName: routeLongName ?? this.routeLongName,
    routeType: routeType ?? this.routeType,
    routeColor: routeColor ?? this.routeColor,
    routeTextColor: routeTextColor ?? this.routeTextColor,
  );
  Route copyWithCompanion(RoutesCompanion data) {
    return Route(
      agencyId: data.agencyId.present ? data.agencyId.value : this.agencyId,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      networkId: data.networkId.present ? data.networkId.value : this.networkId,
      routeShortName: data.routeShortName.present
          ? data.routeShortName.value
          : this.routeShortName,
      routeLongName: data.routeLongName.present
          ? data.routeLongName.value
          : this.routeLongName,
      routeType: data.routeType.present ? data.routeType.value : this.routeType,
      routeColor: data.routeColor.present
          ? data.routeColor.value
          : this.routeColor,
      routeTextColor: data.routeTextColor.present
          ? data.routeTextColor.value
          : this.routeTextColor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Route(')
          ..write('agencyId: $agencyId, ')
          ..write('routeId: $routeId, ')
          ..write('networkId: $networkId, ')
          ..write('routeShortName: $routeShortName, ')
          ..write('routeLongName: $routeLongName, ')
          ..write('routeType: $routeType, ')
          ..write('routeColor: $routeColor, ')
          ..write('routeTextColor: $routeTextColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    agencyId,
    routeId,
    networkId,
    routeShortName,
    routeLongName,
    routeType,
    routeColor,
    routeTextColor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Route &&
          other.agencyId == this.agencyId &&
          other.routeId == this.routeId &&
          other.networkId == this.networkId &&
          other.routeShortName == this.routeShortName &&
          other.routeLongName == this.routeLongName &&
          other.routeType == this.routeType &&
          other.routeColor == this.routeColor &&
          other.routeTextColor == this.routeTextColor);
}

class RoutesCompanion extends UpdateCompanion<Route> {
  final Value<String> agencyId;
  final Value<String> routeId;
  final Value<String> networkId;
  final Value<String> routeShortName;
  final Value<String> routeLongName;
  final Value<int> routeType;
  final Value<String> routeColor;
  final Value<String> routeTextColor;
  final Value<int> rowid;
  const RoutesCompanion({
    this.agencyId = const Value.absent(),
    this.routeId = const Value.absent(),
    this.networkId = const Value.absent(),
    this.routeShortName = const Value.absent(),
    this.routeLongName = const Value.absent(),
    this.routeType = const Value.absent(),
    this.routeColor = const Value.absent(),
    this.routeTextColor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutesCompanion.insert({
    required String agencyId,
    required String routeId,
    required String networkId,
    required String routeShortName,
    required String routeLongName,
    required int routeType,
    required String routeColor,
    required String routeTextColor,
    this.rowid = const Value.absent(),
  }) : agencyId = Value(agencyId),
       routeId = Value(routeId),
       networkId = Value(networkId),
       routeShortName = Value(routeShortName),
       routeLongName = Value(routeLongName),
       routeType = Value(routeType),
       routeColor = Value(routeColor),
       routeTextColor = Value(routeTextColor);
  static Insertable<Route> custom({
    Expression<String>? agencyId,
    Expression<String>? routeId,
    Expression<String>? networkId,
    Expression<String>? routeShortName,
    Expression<String>? routeLongName,
    Expression<int>? routeType,
    Expression<String>? routeColor,
    Expression<String>? routeTextColor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (agencyId != null) 'agency_id': agencyId,
      if (routeId != null) 'route_id': routeId,
      if (networkId != null) 'network_id': networkId,
      if (routeShortName != null) 'route_short_name': routeShortName,
      if (routeLongName != null) 'route_long_name': routeLongName,
      if (routeType != null) 'route_type': routeType,
      if (routeColor != null) 'route_color': routeColor,
      if (routeTextColor != null) 'route_text_color': routeTextColor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutesCompanion copyWith({
    Value<String>? agencyId,
    Value<String>? routeId,
    Value<String>? networkId,
    Value<String>? routeShortName,
    Value<String>? routeLongName,
    Value<int>? routeType,
    Value<String>? routeColor,
    Value<String>? routeTextColor,
    Value<int>? rowid,
  }) {
    return RoutesCompanion(
      agencyId: agencyId ?? this.agencyId,
      routeId: routeId ?? this.routeId,
      networkId: networkId ?? this.networkId,
      routeShortName: routeShortName ?? this.routeShortName,
      routeLongName: routeLongName ?? this.routeLongName,
      routeType: routeType ?? this.routeType,
      routeColor: routeColor ?? this.routeColor,
      routeTextColor: routeTextColor ?? this.routeTextColor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (agencyId.present) {
      map['agency_id'] = Variable<String>(agencyId.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (networkId.present) {
      map['network_id'] = Variable<String>(networkId.value);
    }
    if (routeShortName.present) {
      map['route_short_name'] = Variable<String>(routeShortName.value);
    }
    if (routeLongName.present) {
      map['route_long_name'] = Variable<String>(routeLongName.value);
    }
    if (routeType.present) {
      map['route_type'] = Variable<int>(routeType.value);
    }
    if (routeColor.present) {
      map['route_color'] = Variable<String>(routeColor.value);
    }
    if (routeTextColor.present) {
      map['route_text_color'] = Variable<String>(routeTextColor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesCompanion(')
          ..write('agencyId: $agencyId, ')
          ..write('routeId: $routeId, ')
          ..write('networkId: $networkId, ')
          ..write('routeShortName: $routeShortName, ')
          ..write('routeLongName: $routeLongName, ')
          ..write('routeType: $routeType, ')
          ..write('routeColor: $routeColor, ')
          ..write('routeTextColor: $routeTextColor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RouteStopTable extends RouteStop
    with TableInfo<$RouteStopTable, RouteStopData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteStopTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _stopIdMeta = const VerificationMeta('stopId');
  @override
  late final GeneratedColumn<String> stopId = GeneratedColumn<String>(
    'stop_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeIdMeta = const VerificationMeta(
    'routeId',
  );
  @override
  late final GeneratedColumn<String> routeId = GeneratedColumn<String>(
    'route_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [stopId, routeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_stop';
  @override
  VerificationContext validateIntegrity(
    Insertable<RouteStopData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('stop_id')) {
      context.handle(
        _stopIdMeta,
        stopId.isAcceptableOrUnknown(data['stop_id']!, _stopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stopIdMeta);
    }
    if (data.containsKey('route_id')) {
      context.handle(
        _routeIdMeta,
        routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RouteStopData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteStopData(
      stopId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stop_id'],
      )!,
      routeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_id'],
      )!,
    );
  }

  @override
  $RouteStopTable createAlias(String alias) {
    return $RouteStopTable(attachedDatabase, alias);
  }
}

class RouteStopData extends DataClass implements Insertable<RouteStopData> {
  final String stopId;
  final String routeId;
  const RouteStopData({required this.stopId, required this.routeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['stop_id'] = Variable<String>(stopId);
    map['route_id'] = Variable<String>(routeId);
    return map;
  }

  RouteStopCompanion toCompanion(bool nullToAbsent) {
    return RouteStopCompanion(stopId: Value(stopId), routeId: Value(routeId));
  }

  factory RouteStopData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteStopData(
      stopId: serializer.fromJson<String>(json['stopId']),
      routeId: serializer.fromJson<String>(json['routeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'stopId': serializer.toJson<String>(stopId),
      'routeId': serializer.toJson<String>(routeId),
    };
  }

  RouteStopData copyWith({String? stopId, String? routeId}) => RouteStopData(
    stopId: stopId ?? this.stopId,
    routeId: routeId ?? this.routeId,
  );
  RouteStopData copyWithCompanion(RouteStopCompanion data) {
    return RouteStopData(
      stopId: data.stopId.present ? data.stopId.value : this.stopId,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteStopData(')
          ..write('stopId: $stopId, ')
          ..write('routeId: $routeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(stopId, routeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteStopData &&
          other.stopId == this.stopId &&
          other.routeId == this.routeId);
}

class RouteStopCompanion extends UpdateCompanion<RouteStopData> {
  final Value<String> stopId;
  final Value<String> routeId;
  final Value<int> rowid;
  const RouteStopCompanion({
    this.stopId = const Value.absent(),
    this.routeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RouteStopCompanion.insert({
    required String stopId,
    required String routeId,
    this.rowid = const Value.absent(),
  }) : stopId = Value(stopId),
       routeId = Value(routeId);
  static Insertable<RouteStopData> custom({
    Expression<String>? stopId,
    Expression<String>? routeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (stopId != null) 'stop_id': stopId,
      if (routeId != null) 'route_id': routeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RouteStopCompanion copyWith({
    Value<String>? stopId,
    Value<String>? routeId,
    Value<int>? rowid,
  }) {
    return RouteStopCompanion(
      stopId: stopId ?? this.stopId,
      routeId: routeId ?? this.routeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (stopId.present) {
      map['stop_id'] = Variable<String>(stopId.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteStopCompanion(')
          ..write('stopId: $stopId, ')
          ..write('routeId: $routeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShapesTable extends Shapes with TableInfo<$ShapesTable, Shape> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShapesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _shapeIdMeta = const VerificationMeta(
    'shapeId',
  );
  @override
  late final GeneratedColumn<String> shapeId = GeneratedColumn<String>(
    'shape_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shapePtLatMeta = const VerificationMeta(
    'shapePtLat',
  );
  @override
  late final GeneratedColumn<double> shapePtLat = GeneratedColumn<double>(
    'shape_pt_lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shapePtLonMeta = const VerificationMeta(
    'shapePtLon',
  );
  @override
  late final GeneratedColumn<double> shapePtLon = GeneratedColumn<double>(
    'shape_pt_lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shapePtSequenceMeta = const VerificationMeta(
    'shapePtSequence',
  );
  @override
  late final GeneratedColumn<int> shapePtSequence = GeneratedColumn<int>(
    'shape_pt_sequence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shapeDistTraveledMeta = const VerificationMeta(
    'shapeDistTraveled',
  );
  @override
  late final GeneratedColumn<double> shapeDistTraveled =
      GeneratedColumn<double>(
        'shape_dist_traveled',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    shapeId,
    shapePtLat,
    shapePtLon,
    shapePtSequence,
    shapeDistTraveled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shapes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Shape> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('shape_id')) {
      context.handle(
        _shapeIdMeta,
        shapeId.isAcceptableOrUnknown(data['shape_id']!, _shapeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shapeIdMeta);
    }
    if (data.containsKey('shape_pt_lat')) {
      context.handle(
        _shapePtLatMeta,
        shapePtLat.isAcceptableOrUnknown(
          data['shape_pt_lat']!,
          _shapePtLatMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shapePtLatMeta);
    }
    if (data.containsKey('shape_pt_lon')) {
      context.handle(
        _shapePtLonMeta,
        shapePtLon.isAcceptableOrUnknown(
          data['shape_pt_lon']!,
          _shapePtLonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shapePtLonMeta);
    }
    if (data.containsKey('shape_pt_sequence')) {
      context.handle(
        _shapePtSequenceMeta,
        shapePtSequence.isAcceptableOrUnknown(
          data['shape_pt_sequence']!,
          _shapePtSequenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shapePtSequenceMeta);
    }
    if (data.containsKey('shape_dist_traveled')) {
      context.handle(
        _shapeDistTraveledMeta,
        shapeDistTraveled.isAcceptableOrUnknown(
          data['shape_dist_traveled']!,
          _shapeDistTraveledMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shapeDistTraveledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Shape map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shape(
      shapeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shape_id'],
      )!,
      shapePtLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}shape_pt_lat'],
      )!,
      shapePtLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}shape_pt_lon'],
      )!,
      shapePtSequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shape_pt_sequence'],
      )!,
      shapeDistTraveled: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}shape_dist_traveled'],
      )!,
    );
  }

  @override
  $ShapesTable createAlias(String alias) {
    return $ShapesTable(attachedDatabase, alias);
  }
}

class Shape extends DataClass implements Insertable<Shape> {
  final String shapeId;
  final double shapePtLat;
  final double shapePtLon;
  final int shapePtSequence;
  final double shapeDistTraveled;
  const Shape({
    required this.shapeId,
    required this.shapePtLat,
    required this.shapePtLon,
    required this.shapePtSequence,
    required this.shapeDistTraveled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['shape_id'] = Variable<String>(shapeId);
    map['shape_pt_lat'] = Variable<double>(shapePtLat);
    map['shape_pt_lon'] = Variable<double>(shapePtLon);
    map['shape_pt_sequence'] = Variable<int>(shapePtSequence);
    map['shape_dist_traveled'] = Variable<double>(shapeDistTraveled);
    return map;
  }

  ShapesCompanion toCompanion(bool nullToAbsent) {
    return ShapesCompanion(
      shapeId: Value(shapeId),
      shapePtLat: Value(shapePtLat),
      shapePtLon: Value(shapePtLon),
      shapePtSequence: Value(shapePtSequence),
      shapeDistTraveled: Value(shapeDistTraveled),
    );
  }

  factory Shape.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shape(
      shapeId: serializer.fromJson<String>(json['shapeId']),
      shapePtLat: serializer.fromJson<double>(json['shapePtLat']),
      shapePtLon: serializer.fromJson<double>(json['shapePtLon']),
      shapePtSequence: serializer.fromJson<int>(json['shapePtSequence']),
      shapeDistTraveled: serializer.fromJson<double>(json['shapeDistTraveled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'shapeId': serializer.toJson<String>(shapeId),
      'shapePtLat': serializer.toJson<double>(shapePtLat),
      'shapePtLon': serializer.toJson<double>(shapePtLon),
      'shapePtSequence': serializer.toJson<int>(shapePtSequence),
      'shapeDistTraveled': serializer.toJson<double>(shapeDistTraveled),
    };
  }

  Shape copyWith({
    String? shapeId,
    double? shapePtLat,
    double? shapePtLon,
    int? shapePtSequence,
    double? shapeDistTraveled,
  }) => Shape(
    shapeId: shapeId ?? this.shapeId,
    shapePtLat: shapePtLat ?? this.shapePtLat,
    shapePtLon: shapePtLon ?? this.shapePtLon,
    shapePtSequence: shapePtSequence ?? this.shapePtSequence,
    shapeDistTraveled: shapeDistTraveled ?? this.shapeDistTraveled,
  );
  Shape copyWithCompanion(ShapesCompanion data) {
    return Shape(
      shapeId: data.shapeId.present ? data.shapeId.value : this.shapeId,
      shapePtLat: data.shapePtLat.present
          ? data.shapePtLat.value
          : this.shapePtLat,
      shapePtLon: data.shapePtLon.present
          ? data.shapePtLon.value
          : this.shapePtLon,
      shapePtSequence: data.shapePtSequence.present
          ? data.shapePtSequence.value
          : this.shapePtSequence,
      shapeDistTraveled: data.shapeDistTraveled.present
          ? data.shapeDistTraveled.value
          : this.shapeDistTraveled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shape(')
          ..write('shapeId: $shapeId, ')
          ..write('shapePtLat: $shapePtLat, ')
          ..write('shapePtLon: $shapePtLon, ')
          ..write('shapePtSequence: $shapePtSequence, ')
          ..write('shapeDistTraveled: $shapeDistTraveled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    shapeId,
    shapePtLat,
    shapePtLon,
    shapePtSequence,
    shapeDistTraveled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shape &&
          other.shapeId == this.shapeId &&
          other.shapePtLat == this.shapePtLat &&
          other.shapePtLon == this.shapePtLon &&
          other.shapePtSequence == this.shapePtSequence &&
          other.shapeDistTraveled == this.shapeDistTraveled);
}

class ShapesCompanion extends UpdateCompanion<Shape> {
  final Value<String> shapeId;
  final Value<double> shapePtLat;
  final Value<double> shapePtLon;
  final Value<int> shapePtSequence;
  final Value<double> shapeDistTraveled;
  final Value<int> rowid;
  const ShapesCompanion({
    this.shapeId = const Value.absent(),
    this.shapePtLat = const Value.absent(),
    this.shapePtLon = const Value.absent(),
    this.shapePtSequence = const Value.absent(),
    this.shapeDistTraveled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShapesCompanion.insert({
    required String shapeId,
    required double shapePtLat,
    required double shapePtLon,
    required int shapePtSequence,
    required double shapeDistTraveled,
    this.rowid = const Value.absent(),
  }) : shapeId = Value(shapeId),
       shapePtLat = Value(shapePtLat),
       shapePtLon = Value(shapePtLon),
       shapePtSequence = Value(shapePtSequence),
       shapeDistTraveled = Value(shapeDistTraveled);
  static Insertable<Shape> custom({
    Expression<String>? shapeId,
    Expression<double>? shapePtLat,
    Expression<double>? shapePtLon,
    Expression<int>? shapePtSequence,
    Expression<double>? shapeDistTraveled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (shapeId != null) 'shape_id': shapeId,
      if (shapePtLat != null) 'shape_pt_lat': shapePtLat,
      if (shapePtLon != null) 'shape_pt_lon': shapePtLon,
      if (shapePtSequence != null) 'shape_pt_sequence': shapePtSequence,
      if (shapeDistTraveled != null) 'shape_dist_traveled': shapeDistTraveled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShapesCompanion copyWith({
    Value<String>? shapeId,
    Value<double>? shapePtLat,
    Value<double>? shapePtLon,
    Value<int>? shapePtSequence,
    Value<double>? shapeDistTraveled,
    Value<int>? rowid,
  }) {
    return ShapesCompanion(
      shapeId: shapeId ?? this.shapeId,
      shapePtLat: shapePtLat ?? this.shapePtLat,
      shapePtLon: shapePtLon ?? this.shapePtLon,
      shapePtSequence: shapePtSequence ?? this.shapePtSequence,
      shapeDistTraveled: shapeDistTraveled ?? this.shapeDistTraveled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (shapeId.present) {
      map['shape_id'] = Variable<String>(shapeId.value);
    }
    if (shapePtLat.present) {
      map['shape_pt_lat'] = Variable<double>(shapePtLat.value);
    }
    if (shapePtLon.present) {
      map['shape_pt_lon'] = Variable<double>(shapePtLon.value);
    }
    if (shapePtSequence.present) {
      map['shape_pt_sequence'] = Variable<int>(shapePtSequence.value);
    }
    if (shapeDistTraveled.present) {
      map['shape_dist_traveled'] = Variable<double>(shapeDistTraveled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShapesCompanion(')
          ..write('shapeId: $shapeId, ')
          ..write('shapePtLat: $shapePtLat, ')
          ..write('shapePtLon: $shapePtLon, ')
          ..write('shapePtSequence: $shapePtSequence, ')
          ..write('shapeDistTraveled: $shapeDistTraveled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StopTimesTable extends StopTimes
    with TableInfo<$StopTimesTable, StopTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StopTimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<int> tripId = GeneratedColumn<int>(
    'trip_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopIdMeta = const VerificationMeta('stopId');
  @override
  late final GeneratedColumn<String> stopId = GeneratedColumn<String>(
    'stop_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _arrivalTimeMeta = const VerificationMeta(
    'arrivalTime',
  );
  @override
  late final GeneratedColumn<String> arrivalTime = GeneratedColumn<String>(
    'arrival_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _departureTimeMeta = const VerificationMeta(
    'departureTime',
  );
  @override
  late final GeneratedColumn<String> departureTime = GeneratedColumn<String>(
    'departure_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopSequenceMeta = const VerificationMeta(
    'stopSequence',
  );
  @override
  late final GeneratedColumn<int> stopSequence = GeneratedColumn<int>(
    'stop_sequence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pickupTypeMeta = const VerificationMeta(
    'pickupType',
  );
  @override
  late final GeneratedColumn<int> pickupType = GeneratedColumn<int>(
    'pickup_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pickupBookingRuleIdMeta =
      const VerificationMeta('pickupBookingRuleId');
  @override
  late final GeneratedColumn<String> pickupBookingRuleId =
      GeneratedColumn<String>(
        'pickup_booking_rule_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    tripId,
    stopId,
    arrivalTime,
    departureTime,
    stopSequence,
    pickupType,
    pickupBookingRuleId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stop_times';
  @override
  VerificationContext validateIntegrity(
    Insertable<StopTime> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('trip_id')) {
      context.handle(
        _tripIdMeta,
        tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('stop_id')) {
      context.handle(
        _stopIdMeta,
        stopId.isAcceptableOrUnknown(data['stop_id']!, _stopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stopIdMeta);
    }
    if (data.containsKey('arrival_time')) {
      context.handle(
        _arrivalTimeMeta,
        arrivalTime.isAcceptableOrUnknown(
          data['arrival_time']!,
          _arrivalTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_arrivalTimeMeta);
    }
    if (data.containsKey('departure_time')) {
      context.handle(
        _departureTimeMeta,
        departureTime.isAcceptableOrUnknown(
          data['departure_time']!,
          _departureTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_departureTimeMeta);
    }
    if (data.containsKey('stop_sequence')) {
      context.handle(
        _stopSequenceMeta,
        stopSequence.isAcceptableOrUnknown(
          data['stop_sequence']!,
          _stopSequenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stopSequenceMeta);
    }
    if (data.containsKey('pickup_type')) {
      context.handle(
        _pickupTypeMeta,
        pickupType.isAcceptableOrUnknown(data['pickup_type']!, _pickupTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_pickupTypeMeta);
    }
    if (data.containsKey('pickup_booking_rule_id')) {
      context.handle(
        _pickupBookingRuleIdMeta,
        pickupBookingRuleId.isAcceptableOrUnknown(
          data['pickup_booking_rule_id']!,
          _pickupBookingRuleIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StopTime map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StopTime(
      tripId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trip_id'],
      )!,
      stopId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stop_id'],
      )!,
      arrivalTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arrival_time'],
      )!,
      departureTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}departure_time'],
      )!,
      stopSequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stop_sequence'],
      )!,
      pickupType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pickup_type'],
      )!,
      pickupBookingRuleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pickup_booking_rule_id'],
      ),
    );
  }

  @override
  $StopTimesTable createAlias(String alias) {
    return $StopTimesTable(attachedDatabase, alias);
  }
}

class StopTime extends DataClass implements Insertable<StopTime> {
  final int tripId;
  final String stopId;
  final String arrivalTime;
  final String departureTime;
  final int stopSequence;
  final int pickupType;
  final String? pickupBookingRuleId;
  const StopTime({
    required this.tripId,
    required this.stopId,
    required this.arrivalTime,
    required this.departureTime,
    required this.stopSequence,
    required this.pickupType,
    this.pickupBookingRuleId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['trip_id'] = Variable<int>(tripId);
    map['stop_id'] = Variable<String>(stopId);
    map['arrival_time'] = Variable<String>(arrivalTime);
    map['departure_time'] = Variable<String>(departureTime);
    map['stop_sequence'] = Variable<int>(stopSequence);
    map['pickup_type'] = Variable<int>(pickupType);
    if (!nullToAbsent || pickupBookingRuleId != null) {
      map['pickup_booking_rule_id'] = Variable<String>(pickupBookingRuleId);
    }
    return map;
  }

  StopTimesCompanion toCompanion(bool nullToAbsent) {
    return StopTimesCompanion(
      tripId: Value(tripId),
      stopId: Value(stopId),
      arrivalTime: Value(arrivalTime),
      departureTime: Value(departureTime),
      stopSequence: Value(stopSequence),
      pickupType: Value(pickupType),
      pickupBookingRuleId: pickupBookingRuleId == null && nullToAbsent
          ? const Value.absent()
          : Value(pickupBookingRuleId),
    );
  }

  factory StopTime.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StopTime(
      tripId: serializer.fromJson<int>(json['tripId']),
      stopId: serializer.fromJson<String>(json['stopId']),
      arrivalTime: serializer.fromJson<String>(json['arrivalTime']),
      departureTime: serializer.fromJson<String>(json['departureTime']),
      stopSequence: serializer.fromJson<int>(json['stopSequence']),
      pickupType: serializer.fromJson<int>(json['pickupType']),
      pickupBookingRuleId: serializer.fromJson<String?>(
        json['pickupBookingRuleId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tripId': serializer.toJson<int>(tripId),
      'stopId': serializer.toJson<String>(stopId),
      'arrivalTime': serializer.toJson<String>(arrivalTime),
      'departureTime': serializer.toJson<String>(departureTime),
      'stopSequence': serializer.toJson<int>(stopSequence),
      'pickupType': serializer.toJson<int>(pickupType),
      'pickupBookingRuleId': serializer.toJson<String?>(pickupBookingRuleId),
    };
  }

  StopTime copyWith({
    int? tripId,
    String? stopId,
    String? arrivalTime,
    String? departureTime,
    int? stopSequence,
    int? pickupType,
    Value<String?> pickupBookingRuleId = const Value.absent(),
  }) => StopTime(
    tripId: tripId ?? this.tripId,
    stopId: stopId ?? this.stopId,
    arrivalTime: arrivalTime ?? this.arrivalTime,
    departureTime: departureTime ?? this.departureTime,
    stopSequence: stopSequence ?? this.stopSequence,
    pickupType: pickupType ?? this.pickupType,
    pickupBookingRuleId: pickupBookingRuleId.present
        ? pickupBookingRuleId.value
        : this.pickupBookingRuleId,
  );
  StopTime copyWithCompanion(StopTimesCompanion data) {
    return StopTime(
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      stopId: data.stopId.present ? data.stopId.value : this.stopId,
      arrivalTime: data.arrivalTime.present
          ? data.arrivalTime.value
          : this.arrivalTime,
      departureTime: data.departureTime.present
          ? data.departureTime.value
          : this.departureTime,
      stopSequence: data.stopSequence.present
          ? data.stopSequence.value
          : this.stopSequence,
      pickupType: data.pickupType.present
          ? data.pickupType.value
          : this.pickupType,
      pickupBookingRuleId: data.pickupBookingRuleId.present
          ? data.pickupBookingRuleId.value
          : this.pickupBookingRuleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StopTime(')
          ..write('tripId: $tripId, ')
          ..write('stopId: $stopId, ')
          ..write('arrivalTime: $arrivalTime, ')
          ..write('departureTime: $departureTime, ')
          ..write('stopSequence: $stopSequence, ')
          ..write('pickupType: $pickupType, ')
          ..write('pickupBookingRuleId: $pickupBookingRuleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    tripId,
    stopId,
    arrivalTime,
    departureTime,
    stopSequence,
    pickupType,
    pickupBookingRuleId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StopTime &&
          other.tripId == this.tripId &&
          other.stopId == this.stopId &&
          other.arrivalTime == this.arrivalTime &&
          other.departureTime == this.departureTime &&
          other.stopSequence == this.stopSequence &&
          other.pickupType == this.pickupType &&
          other.pickupBookingRuleId == this.pickupBookingRuleId);
}

class StopTimesCompanion extends UpdateCompanion<StopTime> {
  final Value<int> tripId;
  final Value<String> stopId;
  final Value<String> arrivalTime;
  final Value<String> departureTime;
  final Value<int> stopSequence;
  final Value<int> pickupType;
  final Value<String?> pickupBookingRuleId;
  final Value<int> rowid;
  const StopTimesCompanion({
    this.tripId = const Value.absent(),
    this.stopId = const Value.absent(),
    this.arrivalTime = const Value.absent(),
    this.departureTime = const Value.absent(),
    this.stopSequence = const Value.absent(),
    this.pickupType = const Value.absent(),
    this.pickupBookingRuleId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StopTimesCompanion.insert({
    required int tripId,
    required String stopId,
    required String arrivalTime,
    required String departureTime,
    required int stopSequence,
    required int pickupType,
    this.pickupBookingRuleId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : tripId = Value(tripId),
       stopId = Value(stopId),
       arrivalTime = Value(arrivalTime),
       departureTime = Value(departureTime),
       stopSequence = Value(stopSequence),
       pickupType = Value(pickupType);
  static Insertable<StopTime> custom({
    Expression<int>? tripId,
    Expression<String>? stopId,
    Expression<String>? arrivalTime,
    Expression<String>? departureTime,
    Expression<int>? stopSequence,
    Expression<int>? pickupType,
    Expression<String>? pickupBookingRuleId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tripId != null) 'trip_id': tripId,
      if (stopId != null) 'stop_id': stopId,
      if (arrivalTime != null) 'arrival_time': arrivalTime,
      if (departureTime != null) 'departure_time': departureTime,
      if (stopSequence != null) 'stop_sequence': stopSequence,
      if (pickupType != null) 'pickup_type': pickupType,
      if (pickupBookingRuleId != null)
        'pickup_booking_rule_id': pickupBookingRuleId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StopTimesCompanion copyWith({
    Value<int>? tripId,
    Value<String>? stopId,
    Value<String>? arrivalTime,
    Value<String>? departureTime,
    Value<int>? stopSequence,
    Value<int>? pickupType,
    Value<String?>? pickupBookingRuleId,
    Value<int>? rowid,
  }) {
    return StopTimesCompanion(
      tripId: tripId ?? this.tripId,
      stopId: stopId ?? this.stopId,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      departureTime: departureTime ?? this.departureTime,
      stopSequence: stopSequence ?? this.stopSequence,
      pickupType: pickupType ?? this.pickupType,
      pickupBookingRuleId: pickupBookingRuleId ?? this.pickupBookingRuleId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tripId.present) {
      map['trip_id'] = Variable<int>(tripId.value);
    }
    if (stopId.present) {
      map['stop_id'] = Variable<String>(stopId.value);
    }
    if (arrivalTime.present) {
      map['arrival_time'] = Variable<String>(arrivalTime.value);
    }
    if (departureTime.present) {
      map['departure_time'] = Variable<String>(departureTime.value);
    }
    if (stopSequence.present) {
      map['stop_sequence'] = Variable<int>(stopSequence.value);
    }
    if (pickupType.present) {
      map['pickup_type'] = Variable<int>(pickupType.value);
    }
    if (pickupBookingRuleId.present) {
      map['pickup_booking_rule_id'] = Variable<String>(
        pickupBookingRuleId.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StopTimesCompanion(')
          ..write('tripId: $tripId, ')
          ..write('stopId: $stopId, ')
          ..write('arrivalTime: $arrivalTime, ')
          ..write('departureTime: $departureTime, ')
          ..write('stopSequence: $stopSequence, ')
          ..write('pickupType: $pickupType, ')
          ..write('pickupBookingRuleId: $pickupBookingRuleId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StopsTable extends Stops with TableInfo<$StopsTable, Stop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StopsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _stopIdMeta = const VerificationMeta('stopId');
  @override
  late final GeneratedColumn<String> stopId = GeneratedColumn<String>(
    'stop_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopCodeMeta = const VerificationMeta(
    'stopCode',
  );
  @override
  late final GeneratedColumn<String> stopCode = GeneratedColumn<String>(
    'stop_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopNameMeta = const VerificationMeta(
    'stopName',
  );
  @override
  late final GeneratedColumn<String> stopName = GeneratedColumn<String>(
    'stop_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopLatMeta = const VerificationMeta(
    'stopLat',
  );
  @override
  late final GeneratedColumn<double> stopLat = GeneratedColumn<double>(
    'stop_lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopLonMeta = const VerificationMeta(
    'stopLon',
  );
  @override
  late final GeneratedColumn<double> stopLon = GeneratedColumn<double>(
    'stop_lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<String> zoneId = GeneratedColumn<String>(
    'zone_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationTypeMeta = const VerificationMeta(
    'locationType',
  );
  @override
  late final GeneratedColumn<String> locationType = GeneratedColumn<String>(
    'location_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentStationMeta = const VerificationMeta(
    'parentStation',
  );
  @override
  late final GeneratedColumn<String> parentStation = GeneratedColumn<String>(
    'parent_station',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wheelchairBoardingMeta =
      const VerificationMeta('wheelchairBoarding');
  @override
  late final GeneratedColumn<int> wheelchairBoarding = GeneratedColumn<int>(
    'wheelchair_boarding',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    stopId,
    stopCode,
    stopName,
    stopLat,
    stopLon,
    zoneId,
    locationType,
    parentStation,
    wheelchairBoarding,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stops';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('stop_id')) {
      context.handle(
        _stopIdMeta,
        stopId.isAcceptableOrUnknown(data['stop_id']!, _stopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stopIdMeta);
    }
    if (data.containsKey('stop_code')) {
      context.handle(
        _stopCodeMeta,
        stopCode.isAcceptableOrUnknown(data['stop_code']!, _stopCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_stopCodeMeta);
    }
    if (data.containsKey('stop_name')) {
      context.handle(
        _stopNameMeta,
        stopName.isAcceptableOrUnknown(data['stop_name']!, _stopNameMeta),
      );
    } else if (isInserting) {
      context.missing(_stopNameMeta);
    }
    if (data.containsKey('stop_lat')) {
      context.handle(
        _stopLatMeta,
        stopLat.isAcceptableOrUnknown(data['stop_lat']!, _stopLatMeta),
      );
    } else if (isInserting) {
      context.missing(_stopLatMeta);
    }
    if (data.containsKey('stop_lon')) {
      context.handle(
        _stopLonMeta,
        stopLon.isAcceptableOrUnknown(data['stop_lon']!, _stopLonMeta),
      );
    } else if (isInserting) {
      context.missing(_stopLonMeta);
    }
    if (data.containsKey('zone_id')) {
      context.handle(
        _zoneIdMeta,
        zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta),
      );
    }
    if (data.containsKey('location_type')) {
      context.handle(
        _locationTypeMeta,
        locationType.isAcceptableOrUnknown(
          data['location_type']!,
          _locationTypeMeta,
        ),
      );
    }
    if (data.containsKey('parent_station')) {
      context.handle(
        _parentStationMeta,
        parentStation.isAcceptableOrUnknown(
          data['parent_station']!,
          _parentStationMeta,
        ),
      );
    }
    if (data.containsKey('wheelchair_boarding')) {
      context.handle(
        _wheelchairBoardingMeta,
        wheelchairBoarding.isAcceptableOrUnknown(
          data['wheelchair_boarding']!,
          _wheelchairBoardingMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wheelchairBoardingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Stop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stop(
      stopId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stop_id'],
      )!,
      stopCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stop_code'],
      )!,
      stopName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stop_name'],
      )!,
      stopLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}stop_lat'],
      )!,
      stopLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}stop_lon'],
      )!,
      zoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zone_id'],
      ),
      locationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_type'],
      ),
      parentStation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_station'],
      ),
      wheelchairBoarding: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wheelchair_boarding'],
      )!,
    );
  }

  @override
  $StopsTable createAlias(String alias) {
    return $StopsTable(attachedDatabase, alias);
  }
}

class Stop extends DataClass implements Insertable<Stop> {
  final String stopId;
  final String stopCode;
  final String stopName;
  final double stopLat;
  final double stopLon;
  final String? zoneId;
  final String? locationType;
  final String? parentStation;
  final int wheelchairBoarding;
  const Stop({
    required this.stopId,
    required this.stopCode,
    required this.stopName,
    required this.stopLat,
    required this.stopLon,
    this.zoneId,
    this.locationType,
    this.parentStation,
    required this.wheelchairBoarding,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['stop_id'] = Variable<String>(stopId);
    map['stop_code'] = Variable<String>(stopCode);
    map['stop_name'] = Variable<String>(stopName);
    map['stop_lat'] = Variable<double>(stopLat);
    map['stop_lon'] = Variable<double>(stopLon);
    if (!nullToAbsent || zoneId != null) {
      map['zone_id'] = Variable<String>(zoneId);
    }
    if (!nullToAbsent || locationType != null) {
      map['location_type'] = Variable<String>(locationType);
    }
    if (!nullToAbsent || parentStation != null) {
      map['parent_station'] = Variable<String>(parentStation);
    }
    map['wheelchair_boarding'] = Variable<int>(wheelchairBoarding);
    return map;
  }

  StopsCompanion toCompanion(bool nullToAbsent) {
    return StopsCompanion(
      stopId: Value(stopId),
      stopCode: Value(stopCode),
      stopName: Value(stopName),
      stopLat: Value(stopLat),
      stopLon: Value(stopLon),
      zoneId: zoneId == null && nullToAbsent
          ? const Value.absent()
          : Value(zoneId),
      locationType: locationType == null && nullToAbsent
          ? const Value.absent()
          : Value(locationType),
      parentStation: parentStation == null && nullToAbsent
          ? const Value.absent()
          : Value(parentStation),
      wheelchairBoarding: Value(wheelchairBoarding),
    );
  }

  factory Stop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stop(
      stopId: serializer.fromJson<String>(json['stopId']),
      stopCode: serializer.fromJson<String>(json['stopCode']),
      stopName: serializer.fromJson<String>(json['stopName']),
      stopLat: serializer.fromJson<double>(json['stopLat']),
      stopLon: serializer.fromJson<double>(json['stopLon']),
      zoneId: serializer.fromJson<String?>(json['zoneId']),
      locationType: serializer.fromJson<String?>(json['locationType']),
      parentStation: serializer.fromJson<String?>(json['parentStation']),
      wheelchairBoarding: serializer.fromJson<int>(json['wheelchairBoarding']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'stopId': serializer.toJson<String>(stopId),
      'stopCode': serializer.toJson<String>(stopCode),
      'stopName': serializer.toJson<String>(stopName),
      'stopLat': serializer.toJson<double>(stopLat),
      'stopLon': serializer.toJson<double>(stopLon),
      'zoneId': serializer.toJson<String?>(zoneId),
      'locationType': serializer.toJson<String?>(locationType),
      'parentStation': serializer.toJson<String?>(parentStation),
      'wheelchairBoarding': serializer.toJson<int>(wheelchairBoarding),
    };
  }

  Stop copyWith({
    String? stopId,
    String? stopCode,
    String? stopName,
    double? stopLat,
    double? stopLon,
    Value<String?> zoneId = const Value.absent(),
    Value<String?> locationType = const Value.absent(),
    Value<String?> parentStation = const Value.absent(),
    int? wheelchairBoarding,
  }) => Stop(
    stopId: stopId ?? this.stopId,
    stopCode: stopCode ?? this.stopCode,
    stopName: stopName ?? this.stopName,
    stopLat: stopLat ?? this.stopLat,
    stopLon: stopLon ?? this.stopLon,
    zoneId: zoneId.present ? zoneId.value : this.zoneId,
    locationType: locationType.present ? locationType.value : this.locationType,
    parentStation: parentStation.present
        ? parentStation.value
        : this.parentStation,
    wheelchairBoarding: wheelchairBoarding ?? this.wheelchairBoarding,
  );
  Stop copyWithCompanion(StopsCompanion data) {
    return Stop(
      stopId: data.stopId.present ? data.stopId.value : this.stopId,
      stopCode: data.stopCode.present ? data.stopCode.value : this.stopCode,
      stopName: data.stopName.present ? data.stopName.value : this.stopName,
      stopLat: data.stopLat.present ? data.stopLat.value : this.stopLat,
      stopLon: data.stopLon.present ? data.stopLon.value : this.stopLon,
      zoneId: data.zoneId.present ? data.zoneId.value : this.zoneId,
      locationType: data.locationType.present
          ? data.locationType.value
          : this.locationType,
      parentStation: data.parentStation.present
          ? data.parentStation.value
          : this.parentStation,
      wheelchairBoarding: data.wheelchairBoarding.present
          ? data.wheelchairBoarding.value
          : this.wheelchairBoarding,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stop(')
          ..write('stopId: $stopId, ')
          ..write('stopCode: $stopCode, ')
          ..write('stopName: $stopName, ')
          ..write('stopLat: $stopLat, ')
          ..write('stopLon: $stopLon, ')
          ..write('zoneId: $zoneId, ')
          ..write('locationType: $locationType, ')
          ..write('parentStation: $parentStation, ')
          ..write('wheelchairBoarding: $wheelchairBoarding')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    stopId,
    stopCode,
    stopName,
    stopLat,
    stopLon,
    zoneId,
    locationType,
    parentStation,
    wheelchairBoarding,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stop &&
          other.stopId == this.stopId &&
          other.stopCode == this.stopCode &&
          other.stopName == this.stopName &&
          other.stopLat == this.stopLat &&
          other.stopLon == this.stopLon &&
          other.zoneId == this.zoneId &&
          other.locationType == this.locationType &&
          other.parentStation == this.parentStation &&
          other.wheelchairBoarding == this.wheelchairBoarding);
}

class StopsCompanion extends UpdateCompanion<Stop> {
  final Value<String> stopId;
  final Value<String> stopCode;
  final Value<String> stopName;
  final Value<double> stopLat;
  final Value<double> stopLon;
  final Value<String?> zoneId;
  final Value<String?> locationType;
  final Value<String?> parentStation;
  final Value<int> wheelchairBoarding;
  final Value<int> rowid;
  const StopsCompanion({
    this.stopId = const Value.absent(),
    this.stopCode = const Value.absent(),
    this.stopName = const Value.absent(),
    this.stopLat = const Value.absent(),
    this.stopLon = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.locationType = const Value.absent(),
    this.parentStation = const Value.absent(),
    this.wheelchairBoarding = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StopsCompanion.insert({
    required String stopId,
    required String stopCode,
    required String stopName,
    required double stopLat,
    required double stopLon,
    this.zoneId = const Value.absent(),
    this.locationType = const Value.absent(),
    this.parentStation = const Value.absent(),
    required int wheelchairBoarding,
    this.rowid = const Value.absent(),
  }) : stopId = Value(stopId),
       stopCode = Value(stopCode),
       stopName = Value(stopName),
       stopLat = Value(stopLat),
       stopLon = Value(stopLon),
       wheelchairBoarding = Value(wheelchairBoarding);
  static Insertable<Stop> custom({
    Expression<String>? stopId,
    Expression<String>? stopCode,
    Expression<String>? stopName,
    Expression<double>? stopLat,
    Expression<double>? stopLon,
    Expression<String>? zoneId,
    Expression<String>? locationType,
    Expression<String>? parentStation,
    Expression<int>? wheelchairBoarding,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (stopId != null) 'stop_id': stopId,
      if (stopCode != null) 'stop_code': stopCode,
      if (stopName != null) 'stop_name': stopName,
      if (stopLat != null) 'stop_lat': stopLat,
      if (stopLon != null) 'stop_lon': stopLon,
      if (zoneId != null) 'zone_id': zoneId,
      if (locationType != null) 'location_type': locationType,
      if (parentStation != null) 'parent_station': parentStation,
      if (wheelchairBoarding != null) 'wheelchair_boarding': wheelchairBoarding,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StopsCompanion copyWith({
    Value<String>? stopId,
    Value<String>? stopCode,
    Value<String>? stopName,
    Value<double>? stopLat,
    Value<double>? stopLon,
    Value<String?>? zoneId,
    Value<String?>? locationType,
    Value<String?>? parentStation,
    Value<int>? wheelchairBoarding,
    Value<int>? rowid,
  }) {
    return StopsCompanion(
      stopId: stopId ?? this.stopId,
      stopCode: stopCode ?? this.stopCode,
      stopName: stopName ?? this.stopName,
      stopLat: stopLat ?? this.stopLat,
      stopLon: stopLon ?? this.stopLon,
      zoneId: zoneId ?? this.zoneId,
      locationType: locationType ?? this.locationType,
      parentStation: parentStation ?? this.parentStation,
      wheelchairBoarding: wheelchairBoarding ?? this.wheelchairBoarding,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (stopId.present) {
      map['stop_id'] = Variable<String>(stopId.value);
    }
    if (stopCode.present) {
      map['stop_code'] = Variable<String>(stopCode.value);
    }
    if (stopName.present) {
      map['stop_name'] = Variable<String>(stopName.value);
    }
    if (stopLat.present) {
      map['stop_lat'] = Variable<double>(stopLat.value);
    }
    if (stopLon.present) {
      map['stop_lon'] = Variable<double>(stopLon.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<String>(zoneId.value);
    }
    if (locationType.present) {
      map['location_type'] = Variable<String>(locationType.value);
    }
    if (parentStation.present) {
      map['parent_station'] = Variable<String>(parentStation.value);
    }
    if (wheelchairBoarding.present) {
      map['wheelchair_boarding'] = Variable<int>(wheelchairBoarding.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StopsCompanion(')
          ..write('stopId: $stopId, ')
          ..write('stopCode: $stopCode, ')
          ..write('stopName: $stopName, ')
          ..write('stopLat: $stopLat, ')
          ..write('stopLon: $stopLon, ')
          ..write('zoneId: $zoneId, ')
          ..write('locationType: $locationType, ')
          ..write('parentStation: $parentStation, ')
          ..write('wheelchairBoarding: $wheelchairBoarding, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _routeIdMeta = const VerificationMeta(
    'routeId',
  );
  @override
  late final GeneratedColumn<String> routeId = GeneratedColumn<String>(
    'route_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<int> tripId = GeneratedColumn<int>(
    'trip_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tripHeadsignMeta = const VerificationMeta(
    'tripHeadsign',
  );
  @override
  late final GeneratedColumn<String> tripHeadsign = GeneratedColumn<String>(
    'trip_headsign',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serviceIdMeta = const VerificationMeta(
    'serviceId',
  );
  @override
  late final GeneratedColumn<String> serviceId = GeneratedColumn<String>(
    'service_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _directionIdMeta = const VerificationMeta(
    'directionId',
  );
  @override
  late final GeneratedColumn<int> directionId = GeneratedColumn<int>(
    'direction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shapeIdMeta = const VerificationMeta(
    'shapeId',
  );
  @override
  late final GeneratedColumn<String> shapeId = GeneratedColumn<String>(
    'shape_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wheelchairAccessibleMeta =
      const VerificationMeta('wheelchairAccessible');
  @override
  late final GeneratedColumn<int> wheelchairAccessible = GeneratedColumn<int>(
    'wheelchair_accessible',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bikesAllowedMeta = const VerificationMeta(
    'bikesAllowed',
  );
  @override
  late final GeneratedColumn<int> bikesAllowed = GeneratedColumn<int>(
    'bikes_allowed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    routeId,
    tripId,
    tripHeadsign,
    serviceId,
    directionId,
    shapeId,
    wheelchairAccessible,
    bikesAllowed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(
    Insertable<Trip> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(
        _routeIdMeta,
        routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(
        _tripIdMeta,
        tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('trip_headsign')) {
      context.handle(
        _tripHeadsignMeta,
        tripHeadsign.isAcceptableOrUnknown(
          data['trip_headsign']!,
          _tripHeadsignMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tripHeadsignMeta);
    }
    if (data.containsKey('service_id')) {
      context.handle(
        _serviceIdMeta,
        serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('direction_id')) {
      context.handle(
        _directionIdMeta,
        directionId.isAcceptableOrUnknown(
          data['direction_id']!,
          _directionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_directionIdMeta);
    }
    if (data.containsKey('shape_id')) {
      context.handle(
        _shapeIdMeta,
        shapeId.isAcceptableOrUnknown(data['shape_id']!, _shapeIdMeta),
      );
    }
    if (data.containsKey('wheelchair_accessible')) {
      context.handle(
        _wheelchairAccessibleMeta,
        wheelchairAccessible.isAcceptableOrUnknown(
          data['wheelchair_accessible']!,
          _wheelchairAccessibleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wheelchairAccessibleMeta);
    }
    if (data.containsKey('bikes_allowed')) {
      context.handle(
        _bikesAllowedMeta,
        bikesAllowed.isAcceptableOrUnknown(
          data['bikes_allowed']!,
          _bikesAllowedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bikesAllowedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      routeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_id'],
      )!,
      tripId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trip_id'],
      )!,
      tripHeadsign: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trip_headsign'],
      )!,
      serviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_id'],
      )!,
      directionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}direction_id'],
      )!,
      shapeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shape_id'],
      ),
      wheelchairAccessible: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wheelchair_accessible'],
      )!,
      bikesAllowed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bikes_allowed'],
      )!,
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final String routeId;
  final int tripId;
  final String tripHeadsign;
  final String serviceId;
  final int directionId;
  final String? shapeId;
  final int wheelchairAccessible;
  final int bikesAllowed;
  const Trip({
    required this.routeId,
    required this.tripId,
    required this.tripHeadsign,
    required this.serviceId,
    required this.directionId,
    this.shapeId,
    required this.wheelchairAccessible,
    required this.bikesAllowed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<String>(routeId);
    map['trip_id'] = Variable<int>(tripId);
    map['trip_headsign'] = Variable<String>(tripHeadsign);
    map['service_id'] = Variable<String>(serviceId);
    map['direction_id'] = Variable<int>(directionId);
    if (!nullToAbsent || shapeId != null) {
      map['shape_id'] = Variable<String>(shapeId);
    }
    map['wheelchair_accessible'] = Variable<int>(wheelchairAccessible);
    map['bikes_allowed'] = Variable<int>(bikesAllowed);
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      routeId: Value(routeId),
      tripId: Value(tripId),
      tripHeadsign: Value(tripHeadsign),
      serviceId: Value(serviceId),
      directionId: Value(directionId),
      shapeId: shapeId == null && nullToAbsent
          ? const Value.absent()
          : Value(shapeId),
      wheelchairAccessible: Value(wheelchairAccessible),
      bikesAllowed: Value(bikesAllowed),
    );
  }

  factory Trip.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      routeId: serializer.fromJson<String>(json['routeId']),
      tripId: serializer.fromJson<int>(json['tripId']),
      tripHeadsign: serializer.fromJson<String>(json['tripHeadsign']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      directionId: serializer.fromJson<int>(json['directionId']),
      shapeId: serializer.fromJson<String?>(json['shapeId']),
      wheelchairAccessible: serializer.fromJson<int>(
        json['wheelchairAccessible'],
      ),
      bikesAllowed: serializer.fromJson<int>(json['bikesAllowed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routeId': serializer.toJson<String>(routeId),
      'tripId': serializer.toJson<int>(tripId),
      'tripHeadsign': serializer.toJson<String>(tripHeadsign),
      'serviceId': serializer.toJson<String>(serviceId),
      'directionId': serializer.toJson<int>(directionId),
      'shapeId': serializer.toJson<String?>(shapeId),
      'wheelchairAccessible': serializer.toJson<int>(wheelchairAccessible),
      'bikesAllowed': serializer.toJson<int>(bikesAllowed),
    };
  }

  Trip copyWith({
    String? routeId,
    int? tripId,
    String? tripHeadsign,
    String? serviceId,
    int? directionId,
    Value<String?> shapeId = const Value.absent(),
    int? wheelchairAccessible,
    int? bikesAllowed,
  }) => Trip(
    routeId: routeId ?? this.routeId,
    tripId: tripId ?? this.tripId,
    tripHeadsign: tripHeadsign ?? this.tripHeadsign,
    serviceId: serviceId ?? this.serviceId,
    directionId: directionId ?? this.directionId,
    shapeId: shapeId.present ? shapeId.value : this.shapeId,
    wheelchairAccessible: wheelchairAccessible ?? this.wheelchairAccessible,
    bikesAllowed: bikesAllowed ?? this.bikesAllowed,
  );
  Trip copyWithCompanion(TripsCompanion data) {
    return Trip(
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      tripHeadsign: data.tripHeadsign.present
          ? data.tripHeadsign.value
          : this.tripHeadsign,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      directionId: data.directionId.present
          ? data.directionId.value
          : this.directionId,
      shapeId: data.shapeId.present ? data.shapeId.value : this.shapeId,
      wheelchairAccessible: data.wheelchairAccessible.present
          ? data.wheelchairAccessible.value
          : this.wheelchairAccessible,
      bikesAllowed: data.bikesAllowed.present
          ? data.bikesAllowed.value
          : this.bikesAllowed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('routeId: $routeId, ')
          ..write('tripId: $tripId, ')
          ..write('tripHeadsign: $tripHeadsign, ')
          ..write('serviceId: $serviceId, ')
          ..write('directionId: $directionId, ')
          ..write('shapeId: $shapeId, ')
          ..write('wheelchairAccessible: $wheelchairAccessible, ')
          ..write('bikesAllowed: $bikesAllowed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    routeId,
    tripId,
    tripHeadsign,
    serviceId,
    directionId,
    shapeId,
    wheelchairAccessible,
    bikesAllowed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.routeId == this.routeId &&
          other.tripId == this.tripId &&
          other.tripHeadsign == this.tripHeadsign &&
          other.serviceId == this.serviceId &&
          other.directionId == this.directionId &&
          other.shapeId == this.shapeId &&
          other.wheelchairAccessible == this.wheelchairAccessible &&
          other.bikesAllowed == this.bikesAllowed);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<String> routeId;
  final Value<int> tripId;
  final Value<String> tripHeadsign;
  final Value<String> serviceId;
  final Value<int> directionId;
  final Value<String?> shapeId;
  final Value<int> wheelchairAccessible;
  final Value<int> bikesAllowed;
  final Value<int> rowid;
  const TripsCompanion({
    this.routeId = const Value.absent(),
    this.tripId = const Value.absent(),
    this.tripHeadsign = const Value.absent(),
    this.serviceId = const Value.absent(),
    this.directionId = const Value.absent(),
    this.shapeId = const Value.absent(),
    this.wheelchairAccessible = const Value.absent(),
    this.bikesAllowed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TripsCompanion.insert({
    required String routeId,
    required int tripId,
    required String tripHeadsign,
    required String serviceId,
    required int directionId,
    this.shapeId = const Value.absent(),
    required int wheelchairAccessible,
    required int bikesAllowed,
    this.rowid = const Value.absent(),
  }) : routeId = Value(routeId),
       tripId = Value(tripId),
       tripHeadsign = Value(tripHeadsign),
       serviceId = Value(serviceId),
       directionId = Value(directionId),
       wheelchairAccessible = Value(wheelchairAccessible),
       bikesAllowed = Value(bikesAllowed);
  static Insertable<Trip> custom({
    Expression<String>? routeId,
    Expression<int>? tripId,
    Expression<String>? tripHeadsign,
    Expression<String>? serviceId,
    Expression<int>? directionId,
    Expression<String>? shapeId,
    Expression<int>? wheelchairAccessible,
    Expression<int>? bikesAllowed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (routeId != null) 'route_id': routeId,
      if (tripId != null) 'trip_id': tripId,
      if (tripHeadsign != null) 'trip_headsign': tripHeadsign,
      if (serviceId != null) 'service_id': serviceId,
      if (directionId != null) 'direction_id': directionId,
      if (shapeId != null) 'shape_id': shapeId,
      if (wheelchairAccessible != null)
        'wheelchair_accessible': wheelchairAccessible,
      if (bikesAllowed != null) 'bikes_allowed': bikesAllowed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TripsCompanion copyWith({
    Value<String>? routeId,
    Value<int>? tripId,
    Value<String>? tripHeadsign,
    Value<String>? serviceId,
    Value<int>? directionId,
    Value<String?>? shapeId,
    Value<int>? wheelchairAccessible,
    Value<int>? bikesAllowed,
    Value<int>? rowid,
  }) {
    return TripsCompanion(
      routeId: routeId ?? this.routeId,
      tripId: tripId ?? this.tripId,
      tripHeadsign: tripHeadsign ?? this.tripHeadsign,
      serviceId: serviceId ?? this.serviceId,
      directionId: directionId ?? this.directionId,
      shapeId: shapeId ?? this.shapeId,
      wheelchairAccessible: wheelchairAccessible ?? this.wheelchairAccessible,
      bikesAllowed: bikesAllowed ?? this.bikesAllowed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<int>(tripId.value);
    }
    if (tripHeadsign.present) {
      map['trip_headsign'] = Variable<String>(tripHeadsign.value);
    }
    if (serviceId.present) {
      map['service_id'] = Variable<String>(serviceId.value);
    }
    if (directionId.present) {
      map['direction_id'] = Variable<int>(directionId.value);
    }
    if (shapeId.present) {
      map['shape_id'] = Variable<String>(shapeId.value);
    }
    if (wheelchairAccessible.present) {
      map['wheelchair_accessible'] = Variable<int>(wheelchairAccessible.value);
    }
    if (bikesAllowed.present) {
      map['bikes_allowed'] = Variable<int>(bikesAllowed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('routeId: $routeId, ')
          ..write('tripId: $tripId, ')
          ..write('tripHeadsign: $tripHeadsign, ')
          ..write('serviceId: $serviceId, ')
          ..write('directionId: $directionId, ')
          ..write('shapeId: $shapeId, ')
          ..write('wheelchairAccessible: $wheelchairAccessible, ')
          ..write('bikesAllowed: $bikesAllowed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$TestDatabase extends GeneratedDatabase {
  _$TestDatabase(QueryExecutor e) : super(e);
  $TestDatabaseManager get managers => $TestDatabaseManager(this);
  late final $AgencyTable agency = $AgencyTable(this);
  late final $CalendarDatesTable calendarDates = $CalendarDatesTable(this);
  late final $FareAttributesTable fareAttributes = $FareAttributesTable(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final $RouteStopTable routeStop = $RouteStopTable(this);
  late final $ShapesTable shapes = $ShapesTable(this);
  late final $StopTimesTable stopTimes = $StopTimesTable(this);
  late final $StopsTable stops = $StopsTable(this);
  late final $TripsTable trips = $TripsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    agency,
    calendarDates,
    fareAttributes,
    routes,
    routeStop,
    shapes,
    stopTimes,
    stops,
    trips,
  ];
}

typedef $$AgencyTableCreateCompanionBuilder =
    AgencyCompanion Function({
      required String agencyId,
      required String agencyName,
      required String agencyUrl,
      required String agencyTimezone,
      required String agencyLang,
      required int agencyPhone,
      Value<int> rowid,
    });
typedef $$AgencyTableUpdateCompanionBuilder =
    AgencyCompanion Function({
      Value<String> agencyId,
      Value<String> agencyName,
      Value<String> agencyUrl,
      Value<String> agencyTimezone,
      Value<String> agencyLang,
      Value<int> agencyPhone,
      Value<int> rowid,
    });

class $$AgencyTableFilterComposer
    extends Composer<_$TestDatabase, $AgencyTable> {
  $$AgencyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get agencyId => $composableBuilder(
    column: $table.agencyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agencyName => $composableBuilder(
    column: $table.agencyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agencyUrl => $composableBuilder(
    column: $table.agencyUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agencyTimezone => $composableBuilder(
    column: $table.agencyTimezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agencyLang => $composableBuilder(
    column: $table.agencyLang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agencyPhone => $composableBuilder(
    column: $table.agencyPhone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AgencyTableOrderingComposer
    extends Composer<_$TestDatabase, $AgencyTable> {
  $$AgencyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get agencyId => $composableBuilder(
    column: $table.agencyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agencyName => $composableBuilder(
    column: $table.agencyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agencyUrl => $composableBuilder(
    column: $table.agencyUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agencyTimezone => $composableBuilder(
    column: $table.agencyTimezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agencyLang => $composableBuilder(
    column: $table.agencyLang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agencyPhone => $composableBuilder(
    column: $table.agencyPhone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AgencyTableAnnotationComposer
    extends Composer<_$TestDatabase, $AgencyTable> {
  $$AgencyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get agencyId =>
      $composableBuilder(column: $table.agencyId, builder: (column) => column);

  GeneratedColumn<String> get agencyName => $composableBuilder(
    column: $table.agencyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get agencyUrl =>
      $composableBuilder(column: $table.agencyUrl, builder: (column) => column);

  GeneratedColumn<String> get agencyTimezone => $composableBuilder(
    column: $table.agencyTimezone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get agencyLang => $composableBuilder(
    column: $table.agencyLang,
    builder: (column) => column,
  );

  GeneratedColumn<int> get agencyPhone => $composableBuilder(
    column: $table.agencyPhone,
    builder: (column) => column,
  );
}

class $$AgencyTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $AgencyTable,
          AgencyData,
          $$AgencyTableFilterComposer,
          $$AgencyTableOrderingComposer,
          $$AgencyTableAnnotationComposer,
          $$AgencyTableCreateCompanionBuilder,
          $$AgencyTableUpdateCompanionBuilder,
          (
            AgencyData,
            BaseReferences<_$TestDatabase, $AgencyTable, AgencyData>,
          ),
          AgencyData,
          PrefetchHooks Function()
        > {
  $$AgencyTableTableManager(_$TestDatabase db, $AgencyTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AgencyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AgencyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AgencyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> agencyId = const Value.absent(),
                Value<String> agencyName = const Value.absent(),
                Value<String> agencyUrl = const Value.absent(),
                Value<String> agencyTimezone = const Value.absent(),
                Value<String> agencyLang = const Value.absent(),
                Value<int> agencyPhone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AgencyCompanion(
                agencyId: agencyId,
                agencyName: agencyName,
                agencyUrl: agencyUrl,
                agencyTimezone: agencyTimezone,
                agencyLang: agencyLang,
                agencyPhone: agencyPhone,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String agencyId,
                required String agencyName,
                required String agencyUrl,
                required String agencyTimezone,
                required String agencyLang,
                required int agencyPhone,
                Value<int> rowid = const Value.absent(),
              }) => AgencyCompanion.insert(
                agencyId: agencyId,
                agencyName: agencyName,
                agencyUrl: agencyUrl,
                agencyTimezone: agencyTimezone,
                agencyLang: agencyLang,
                agencyPhone: agencyPhone,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AgencyTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $AgencyTable,
      AgencyData,
      $$AgencyTableFilterComposer,
      $$AgencyTableOrderingComposer,
      $$AgencyTableAnnotationComposer,
      $$AgencyTableCreateCompanionBuilder,
      $$AgencyTableUpdateCompanionBuilder,
      (AgencyData, BaseReferences<_$TestDatabase, $AgencyTable, AgencyData>),
      AgencyData,
      PrefetchHooks Function()
    >;
typedef $$CalendarDatesTableCreateCompanionBuilder =
    CalendarDatesCompanion Function({
      required String serviceId,
      required int date,
      required int exceptionType,
      Value<int> rowid,
    });
typedef $$CalendarDatesTableUpdateCompanionBuilder =
    CalendarDatesCompanion Function({
      Value<String> serviceId,
      Value<int> date,
      Value<int> exceptionType,
      Value<int> rowid,
    });

class $$CalendarDatesTableFilterComposer
    extends Composer<_$TestDatabase, $CalendarDatesTable> {
  $$CalendarDatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exceptionType => $composableBuilder(
    column: $table.exceptionType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarDatesTableOrderingComposer
    extends Composer<_$TestDatabase, $CalendarDatesTable> {
  $$CalendarDatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exceptionType => $composableBuilder(
    column: $table.exceptionType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarDatesTableAnnotationComposer
    extends Composer<_$TestDatabase, $CalendarDatesTable> {
  $$CalendarDatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get exceptionType => $composableBuilder(
    column: $table.exceptionType,
    builder: (column) => column,
  );
}

class $$CalendarDatesTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $CalendarDatesTable,
          CalendarDate,
          $$CalendarDatesTableFilterComposer,
          $$CalendarDatesTableOrderingComposer,
          $$CalendarDatesTableAnnotationComposer,
          $$CalendarDatesTableCreateCompanionBuilder,
          $$CalendarDatesTableUpdateCompanionBuilder,
          (
            CalendarDate,
            BaseReferences<_$TestDatabase, $CalendarDatesTable, CalendarDate>,
          ),
          CalendarDate,
          PrefetchHooks Function()
        > {
  $$CalendarDatesTableTableManager(_$TestDatabase db, $CalendarDatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarDatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarDatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarDatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> serviceId = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> exceptionType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarDatesCompanion(
                serviceId: serviceId,
                date: date,
                exceptionType: exceptionType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String serviceId,
                required int date,
                required int exceptionType,
                Value<int> rowid = const Value.absent(),
              }) => CalendarDatesCompanion.insert(
                serviceId: serviceId,
                date: date,
                exceptionType: exceptionType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarDatesTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $CalendarDatesTable,
      CalendarDate,
      $$CalendarDatesTableFilterComposer,
      $$CalendarDatesTableOrderingComposer,
      $$CalendarDatesTableAnnotationComposer,
      $$CalendarDatesTableCreateCompanionBuilder,
      $$CalendarDatesTableUpdateCompanionBuilder,
      (
        CalendarDate,
        BaseReferences<_$TestDatabase, $CalendarDatesTable, CalendarDate>,
      ),
      CalendarDate,
      PrefetchHooks Function()
    >;
typedef $$FareAttributesTableCreateCompanionBuilder =
    FareAttributesCompanion Function({
      required String fareId,
      required int price,
      required String currencyType,
      required int paymentMethod,
      required String transfers,
      required int transferDuration,
      Value<int> rowid,
    });
typedef $$FareAttributesTableUpdateCompanionBuilder =
    FareAttributesCompanion Function({
      Value<String> fareId,
      Value<int> price,
      Value<String> currencyType,
      Value<int> paymentMethod,
      Value<String> transfers,
      Value<int> transferDuration,
      Value<int> rowid,
    });

class $$FareAttributesTableFilterComposer
    extends Composer<_$TestDatabase, $FareAttributesTable> {
  $$FareAttributesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get fareId => $composableBuilder(
    column: $table.fareId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyType => $composableBuilder(
    column: $table.currencyType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transfers => $composableBuilder(
    column: $table.transfers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get transferDuration => $composableBuilder(
    column: $table.transferDuration,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FareAttributesTableOrderingComposer
    extends Composer<_$TestDatabase, $FareAttributesTable> {
  $$FareAttributesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get fareId => $composableBuilder(
    column: $table.fareId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyType => $composableBuilder(
    column: $table.currencyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transfers => $composableBuilder(
    column: $table.transfers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get transferDuration => $composableBuilder(
    column: $table.transferDuration,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FareAttributesTableAnnotationComposer
    extends Composer<_$TestDatabase, $FareAttributesTable> {
  $$FareAttributesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get fareId =>
      $composableBuilder(column: $table.fareId, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get currencyType => $composableBuilder(
    column: $table.currencyType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get transfers =>
      $composableBuilder(column: $table.transfers, builder: (column) => column);

  GeneratedColumn<int> get transferDuration => $composableBuilder(
    column: $table.transferDuration,
    builder: (column) => column,
  );
}

class $$FareAttributesTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $FareAttributesTable,
          FareAttribute,
          $$FareAttributesTableFilterComposer,
          $$FareAttributesTableOrderingComposer,
          $$FareAttributesTableAnnotationComposer,
          $$FareAttributesTableCreateCompanionBuilder,
          $$FareAttributesTableUpdateCompanionBuilder,
          (
            FareAttribute,
            BaseReferences<_$TestDatabase, $FareAttributesTable, FareAttribute>,
          ),
          FareAttribute,
          PrefetchHooks Function()
        > {
  $$FareAttributesTableTableManager(
    _$TestDatabase db,
    $FareAttributesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FareAttributesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FareAttributesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FareAttributesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> fareId = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<String> currencyType = const Value.absent(),
                Value<int> paymentMethod = const Value.absent(),
                Value<String> transfers = const Value.absent(),
                Value<int> transferDuration = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FareAttributesCompanion(
                fareId: fareId,
                price: price,
                currencyType: currencyType,
                paymentMethod: paymentMethod,
                transfers: transfers,
                transferDuration: transferDuration,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String fareId,
                required int price,
                required String currencyType,
                required int paymentMethod,
                required String transfers,
                required int transferDuration,
                Value<int> rowid = const Value.absent(),
              }) => FareAttributesCompanion.insert(
                fareId: fareId,
                price: price,
                currencyType: currencyType,
                paymentMethod: paymentMethod,
                transfers: transfers,
                transferDuration: transferDuration,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FareAttributesTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $FareAttributesTable,
      FareAttribute,
      $$FareAttributesTableFilterComposer,
      $$FareAttributesTableOrderingComposer,
      $$FareAttributesTableAnnotationComposer,
      $$FareAttributesTableCreateCompanionBuilder,
      $$FareAttributesTableUpdateCompanionBuilder,
      (
        FareAttribute,
        BaseReferences<_$TestDatabase, $FareAttributesTable, FareAttribute>,
      ),
      FareAttribute,
      PrefetchHooks Function()
    >;
typedef $$RoutesTableCreateCompanionBuilder =
    RoutesCompanion Function({
      required String agencyId,
      required String routeId,
      required String networkId,
      required String routeShortName,
      required String routeLongName,
      required int routeType,
      required String routeColor,
      required String routeTextColor,
      Value<int> rowid,
    });
typedef $$RoutesTableUpdateCompanionBuilder =
    RoutesCompanion Function({
      Value<String> agencyId,
      Value<String> routeId,
      Value<String> networkId,
      Value<String> routeShortName,
      Value<String> routeLongName,
      Value<int> routeType,
      Value<String> routeColor,
      Value<String> routeTextColor,
      Value<int> rowid,
    });

class $$RoutesTableFilterComposer
    extends Composer<_$TestDatabase, $RoutesTable> {
  $$RoutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get agencyId => $composableBuilder(
    column: $table.agencyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get networkId => $composableBuilder(
    column: $table.networkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeShortName => $composableBuilder(
    column: $table.routeShortName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeLongName => $composableBuilder(
    column: $table.routeLongName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get routeType => $composableBuilder(
    column: $table.routeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeColor => $composableBuilder(
    column: $table.routeColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeTextColor => $composableBuilder(
    column: $table.routeTextColor,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutesTableOrderingComposer
    extends Composer<_$TestDatabase, $RoutesTable> {
  $$RoutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get agencyId => $composableBuilder(
    column: $table.agencyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get networkId => $composableBuilder(
    column: $table.networkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeShortName => $composableBuilder(
    column: $table.routeShortName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeLongName => $composableBuilder(
    column: $table.routeLongName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get routeType => $composableBuilder(
    column: $table.routeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeColor => $composableBuilder(
    column: $table.routeColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeTextColor => $composableBuilder(
    column: $table.routeTextColor,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutesTableAnnotationComposer
    extends Composer<_$TestDatabase, $RoutesTable> {
  $$RoutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get agencyId =>
      $composableBuilder(column: $table.agencyId, builder: (column) => column);

  GeneratedColumn<String> get routeId =>
      $composableBuilder(column: $table.routeId, builder: (column) => column);

  GeneratedColumn<String> get networkId =>
      $composableBuilder(column: $table.networkId, builder: (column) => column);

  GeneratedColumn<String> get routeShortName => $composableBuilder(
    column: $table.routeShortName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get routeLongName => $composableBuilder(
    column: $table.routeLongName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get routeType =>
      $composableBuilder(column: $table.routeType, builder: (column) => column);

  GeneratedColumn<String> get routeColor => $composableBuilder(
    column: $table.routeColor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get routeTextColor => $composableBuilder(
    column: $table.routeTextColor,
    builder: (column) => column,
  );
}

class $$RoutesTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $RoutesTable,
          Route,
          $$RoutesTableFilterComposer,
          $$RoutesTableOrderingComposer,
          $$RoutesTableAnnotationComposer,
          $$RoutesTableCreateCompanionBuilder,
          $$RoutesTableUpdateCompanionBuilder,
          (Route, BaseReferences<_$TestDatabase, $RoutesTable, Route>),
          Route,
          PrefetchHooks Function()
        > {
  $$RoutesTableTableManager(_$TestDatabase db, $RoutesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> agencyId = const Value.absent(),
                Value<String> routeId = const Value.absent(),
                Value<String> networkId = const Value.absent(),
                Value<String> routeShortName = const Value.absent(),
                Value<String> routeLongName = const Value.absent(),
                Value<int> routeType = const Value.absent(),
                Value<String> routeColor = const Value.absent(),
                Value<String> routeTextColor = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutesCompanion(
                agencyId: agencyId,
                routeId: routeId,
                networkId: networkId,
                routeShortName: routeShortName,
                routeLongName: routeLongName,
                routeType: routeType,
                routeColor: routeColor,
                routeTextColor: routeTextColor,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String agencyId,
                required String routeId,
                required String networkId,
                required String routeShortName,
                required String routeLongName,
                required int routeType,
                required String routeColor,
                required String routeTextColor,
                Value<int> rowid = const Value.absent(),
              }) => RoutesCompanion.insert(
                agencyId: agencyId,
                routeId: routeId,
                networkId: networkId,
                routeShortName: routeShortName,
                routeLongName: routeLongName,
                routeType: routeType,
                routeColor: routeColor,
                routeTextColor: routeTextColor,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutesTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $RoutesTable,
      Route,
      $$RoutesTableFilterComposer,
      $$RoutesTableOrderingComposer,
      $$RoutesTableAnnotationComposer,
      $$RoutesTableCreateCompanionBuilder,
      $$RoutesTableUpdateCompanionBuilder,
      (Route, BaseReferences<_$TestDatabase, $RoutesTable, Route>),
      Route,
      PrefetchHooks Function()
    >;
typedef $$RouteStopTableCreateCompanionBuilder =
    RouteStopCompanion Function({
      required String stopId,
      required String routeId,
      Value<int> rowid,
    });
typedef $$RouteStopTableUpdateCompanionBuilder =
    RouteStopCompanion Function({
      Value<String> stopId,
      Value<String> routeId,
      Value<int> rowid,
    });

class $$RouteStopTableFilterComposer
    extends Composer<_$TestDatabase, $RouteStopTable> {
  $$RouteStopTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RouteStopTableOrderingComposer
    extends Composer<_$TestDatabase, $RouteStopTable> {
  $$RouteStopTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RouteStopTableAnnotationComposer
    extends Composer<_$TestDatabase, $RouteStopTable> {
  $$RouteStopTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get stopId =>
      $composableBuilder(column: $table.stopId, builder: (column) => column);

  GeneratedColumn<String> get routeId =>
      $composableBuilder(column: $table.routeId, builder: (column) => column);
}

class $$RouteStopTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $RouteStopTable,
          RouteStopData,
          $$RouteStopTableFilterComposer,
          $$RouteStopTableOrderingComposer,
          $$RouteStopTableAnnotationComposer,
          $$RouteStopTableCreateCompanionBuilder,
          $$RouteStopTableUpdateCompanionBuilder,
          (
            RouteStopData,
            BaseReferences<_$TestDatabase, $RouteStopTable, RouteStopData>,
          ),
          RouteStopData,
          PrefetchHooks Function()
        > {
  $$RouteStopTableTableManager(_$TestDatabase db, $RouteStopTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RouteStopTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RouteStopTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RouteStopTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> stopId = const Value.absent(),
                Value<String> routeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RouteStopCompanion(
                stopId: stopId,
                routeId: routeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String stopId,
                required String routeId,
                Value<int> rowid = const Value.absent(),
              }) => RouteStopCompanion.insert(
                stopId: stopId,
                routeId: routeId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RouteStopTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $RouteStopTable,
      RouteStopData,
      $$RouteStopTableFilterComposer,
      $$RouteStopTableOrderingComposer,
      $$RouteStopTableAnnotationComposer,
      $$RouteStopTableCreateCompanionBuilder,
      $$RouteStopTableUpdateCompanionBuilder,
      (
        RouteStopData,
        BaseReferences<_$TestDatabase, $RouteStopTable, RouteStopData>,
      ),
      RouteStopData,
      PrefetchHooks Function()
    >;
typedef $$ShapesTableCreateCompanionBuilder =
    ShapesCompanion Function({
      required String shapeId,
      required double shapePtLat,
      required double shapePtLon,
      required int shapePtSequence,
      required double shapeDistTraveled,
      Value<int> rowid,
    });
typedef $$ShapesTableUpdateCompanionBuilder =
    ShapesCompanion Function({
      Value<String> shapeId,
      Value<double> shapePtLat,
      Value<double> shapePtLon,
      Value<int> shapePtSequence,
      Value<double> shapeDistTraveled,
      Value<int> rowid,
    });

class $$ShapesTableFilterComposer
    extends Composer<_$TestDatabase, $ShapesTable> {
  $$ShapesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get shapeId => $composableBuilder(
    column: $table.shapeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get shapePtLat => $composableBuilder(
    column: $table.shapePtLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get shapePtLon => $composableBuilder(
    column: $table.shapePtLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shapePtSequence => $composableBuilder(
    column: $table.shapePtSequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get shapeDistTraveled => $composableBuilder(
    column: $table.shapeDistTraveled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShapesTableOrderingComposer
    extends Composer<_$TestDatabase, $ShapesTable> {
  $$ShapesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get shapeId => $composableBuilder(
    column: $table.shapeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get shapePtLat => $composableBuilder(
    column: $table.shapePtLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get shapePtLon => $composableBuilder(
    column: $table.shapePtLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shapePtSequence => $composableBuilder(
    column: $table.shapePtSequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get shapeDistTraveled => $composableBuilder(
    column: $table.shapeDistTraveled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShapesTableAnnotationComposer
    extends Composer<_$TestDatabase, $ShapesTable> {
  $$ShapesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get shapeId =>
      $composableBuilder(column: $table.shapeId, builder: (column) => column);

  GeneratedColumn<double> get shapePtLat => $composableBuilder(
    column: $table.shapePtLat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get shapePtLon => $composableBuilder(
    column: $table.shapePtLon,
    builder: (column) => column,
  );

  GeneratedColumn<int> get shapePtSequence => $composableBuilder(
    column: $table.shapePtSequence,
    builder: (column) => column,
  );

  GeneratedColumn<double> get shapeDistTraveled => $composableBuilder(
    column: $table.shapeDistTraveled,
    builder: (column) => column,
  );
}

class $$ShapesTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $ShapesTable,
          Shape,
          $$ShapesTableFilterComposer,
          $$ShapesTableOrderingComposer,
          $$ShapesTableAnnotationComposer,
          $$ShapesTableCreateCompanionBuilder,
          $$ShapesTableUpdateCompanionBuilder,
          (Shape, BaseReferences<_$TestDatabase, $ShapesTable, Shape>),
          Shape,
          PrefetchHooks Function()
        > {
  $$ShapesTableTableManager(_$TestDatabase db, $ShapesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShapesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShapesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShapesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> shapeId = const Value.absent(),
                Value<double> shapePtLat = const Value.absent(),
                Value<double> shapePtLon = const Value.absent(),
                Value<int> shapePtSequence = const Value.absent(),
                Value<double> shapeDistTraveled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShapesCompanion(
                shapeId: shapeId,
                shapePtLat: shapePtLat,
                shapePtLon: shapePtLon,
                shapePtSequence: shapePtSequence,
                shapeDistTraveled: shapeDistTraveled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String shapeId,
                required double shapePtLat,
                required double shapePtLon,
                required int shapePtSequence,
                required double shapeDistTraveled,
                Value<int> rowid = const Value.absent(),
              }) => ShapesCompanion.insert(
                shapeId: shapeId,
                shapePtLat: shapePtLat,
                shapePtLon: shapePtLon,
                shapePtSequence: shapePtSequence,
                shapeDistTraveled: shapeDistTraveled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShapesTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $ShapesTable,
      Shape,
      $$ShapesTableFilterComposer,
      $$ShapesTableOrderingComposer,
      $$ShapesTableAnnotationComposer,
      $$ShapesTableCreateCompanionBuilder,
      $$ShapesTableUpdateCompanionBuilder,
      (Shape, BaseReferences<_$TestDatabase, $ShapesTable, Shape>),
      Shape,
      PrefetchHooks Function()
    >;
typedef $$StopTimesTableCreateCompanionBuilder =
    StopTimesCompanion Function({
      required int tripId,
      required String stopId,
      required String arrivalTime,
      required String departureTime,
      required int stopSequence,
      required int pickupType,
      Value<String?> pickupBookingRuleId,
      Value<int> rowid,
    });
typedef $$StopTimesTableUpdateCompanionBuilder =
    StopTimesCompanion Function({
      Value<int> tripId,
      Value<String> stopId,
      Value<String> arrivalTime,
      Value<String> departureTime,
      Value<int> stopSequence,
      Value<int> pickupType,
      Value<String?> pickupBookingRuleId,
      Value<int> rowid,
    });

class $$StopTimesTableFilterComposer
    extends Composer<_$TestDatabase, $StopTimesTable> {
  $$StopTimesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arrivalTime => $composableBuilder(
    column: $table.arrivalTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stopSequence => $composableBuilder(
    column: $table.stopSequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pickupType => $composableBuilder(
    column: $table.pickupType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pickupBookingRuleId => $composableBuilder(
    column: $table.pickupBookingRuleId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StopTimesTableOrderingComposer
    extends Composer<_$TestDatabase, $StopTimesTable> {
  $$StopTimesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arrivalTime => $composableBuilder(
    column: $table.arrivalTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stopSequence => $composableBuilder(
    column: $table.stopSequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pickupType => $composableBuilder(
    column: $table.pickupType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pickupBookingRuleId => $composableBuilder(
    column: $table.pickupBookingRuleId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StopTimesTableAnnotationComposer
    extends Composer<_$TestDatabase, $StopTimesTable> {
  $$StopTimesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get tripId =>
      $composableBuilder(column: $table.tripId, builder: (column) => column);

  GeneratedColumn<String> get stopId =>
      $composableBuilder(column: $table.stopId, builder: (column) => column);

  GeneratedColumn<String> get arrivalTime => $composableBuilder(
    column: $table.arrivalTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stopSequence => $composableBuilder(
    column: $table.stopSequence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pickupType => $composableBuilder(
    column: $table.pickupType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pickupBookingRuleId => $composableBuilder(
    column: $table.pickupBookingRuleId,
    builder: (column) => column,
  );
}

class $$StopTimesTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $StopTimesTable,
          StopTime,
          $$StopTimesTableFilterComposer,
          $$StopTimesTableOrderingComposer,
          $$StopTimesTableAnnotationComposer,
          $$StopTimesTableCreateCompanionBuilder,
          $$StopTimesTableUpdateCompanionBuilder,
          (StopTime, BaseReferences<_$TestDatabase, $StopTimesTable, StopTime>),
          StopTime,
          PrefetchHooks Function()
        > {
  $$StopTimesTableTableManager(_$TestDatabase db, $StopTimesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StopTimesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StopTimesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StopTimesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> tripId = const Value.absent(),
                Value<String> stopId = const Value.absent(),
                Value<String> arrivalTime = const Value.absent(),
                Value<String> departureTime = const Value.absent(),
                Value<int> stopSequence = const Value.absent(),
                Value<int> pickupType = const Value.absent(),
                Value<String?> pickupBookingRuleId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StopTimesCompanion(
                tripId: tripId,
                stopId: stopId,
                arrivalTime: arrivalTime,
                departureTime: departureTime,
                stopSequence: stopSequence,
                pickupType: pickupType,
                pickupBookingRuleId: pickupBookingRuleId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int tripId,
                required String stopId,
                required String arrivalTime,
                required String departureTime,
                required int stopSequence,
                required int pickupType,
                Value<String?> pickupBookingRuleId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StopTimesCompanion.insert(
                tripId: tripId,
                stopId: stopId,
                arrivalTime: arrivalTime,
                departureTime: departureTime,
                stopSequence: stopSequence,
                pickupType: pickupType,
                pickupBookingRuleId: pickupBookingRuleId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StopTimesTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $StopTimesTable,
      StopTime,
      $$StopTimesTableFilterComposer,
      $$StopTimesTableOrderingComposer,
      $$StopTimesTableAnnotationComposer,
      $$StopTimesTableCreateCompanionBuilder,
      $$StopTimesTableUpdateCompanionBuilder,
      (StopTime, BaseReferences<_$TestDatabase, $StopTimesTable, StopTime>),
      StopTime,
      PrefetchHooks Function()
    >;
typedef $$StopsTableCreateCompanionBuilder =
    StopsCompanion Function({
      required String stopId,
      required String stopCode,
      required String stopName,
      required double stopLat,
      required double stopLon,
      Value<String?> zoneId,
      Value<String?> locationType,
      Value<String?> parentStation,
      required int wheelchairBoarding,
      Value<int> rowid,
    });
typedef $$StopsTableUpdateCompanionBuilder =
    StopsCompanion Function({
      Value<String> stopId,
      Value<String> stopCode,
      Value<String> stopName,
      Value<double> stopLat,
      Value<double> stopLon,
      Value<String?> zoneId,
      Value<String?> locationType,
      Value<String?> parentStation,
      Value<int> wheelchairBoarding,
      Value<int> rowid,
    });

class $$StopsTableFilterComposer extends Composer<_$TestDatabase, $StopsTable> {
  $$StopsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stopCode => $composableBuilder(
    column: $table.stopCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stopName => $composableBuilder(
    column: $table.stopName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stopLat => $composableBuilder(
    column: $table.stopLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stopLon => $composableBuilder(
    column: $table.stopLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zoneId => $composableBuilder(
    column: $table.zoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationType => $composableBuilder(
    column: $table.locationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentStation => $composableBuilder(
    column: $table.parentStation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wheelchairBoarding => $composableBuilder(
    column: $table.wheelchairBoarding,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StopsTableOrderingComposer
    extends Composer<_$TestDatabase, $StopsTable> {
  $$StopsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stopCode => $composableBuilder(
    column: $table.stopCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stopName => $composableBuilder(
    column: $table.stopName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stopLat => $composableBuilder(
    column: $table.stopLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stopLon => $composableBuilder(
    column: $table.stopLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zoneId => $composableBuilder(
    column: $table.zoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationType => $composableBuilder(
    column: $table.locationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentStation => $composableBuilder(
    column: $table.parentStation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wheelchairBoarding => $composableBuilder(
    column: $table.wheelchairBoarding,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StopsTableAnnotationComposer
    extends Composer<_$TestDatabase, $StopsTable> {
  $$StopsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get stopId =>
      $composableBuilder(column: $table.stopId, builder: (column) => column);

  GeneratedColumn<String> get stopCode =>
      $composableBuilder(column: $table.stopCode, builder: (column) => column);

  GeneratedColumn<String> get stopName =>
      $composableBuilder(column: $table.stopName, builder: (column) => column);

  GeneratedColumn<double> get stopLat =>
      $composableBuilder(column: $table.stopLat, builder: (column) => column);

  GeneratedColumn<double> get stopLon =>
      $composableBuilder(column: $table.stopLon, builder: (column) => column);

  GeneratedColumn<String> get zoneId =>
      $composableBuilder(column: $table.zoneId, builder: (column) => column);

  GeneratedColumn<String> get locationType => $composableBuilder(
    column: $table.locationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentStation => $composableBuilder(
    column: $table.parentStation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wheelchairBoarding => $composableBuilder(
    column: $table.wheelchairBoarding,
    builder: (column) => column,
  );
}

class $$StopsTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $StopsTable,
          Stop,
          $$StopsTableFilterComposer,
          $$StopsTableOrderingComposer,
          $$StopsTableAnnotationComposer,
          $$StopsTableCreateCompanionBuilder,
          $$StopsTableUpdateCompanionBuilder,
          (Stop, BaseReferences<_$TestDatabase, $StopsTable, Stop>),
          Stop,
          PrefetchHooks Function()
        > {
  $$StopsTableTableManager(_$TestDatabase db, $StopsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StopsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StopsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StopsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> stopId = const Value.absent(),
                Value<String> stopCode = const Value.absent(),
                Value<String> stopName = const Value.absent(),
                Value<double> stopLat = const Value.absent(),
                Value<double> stopLon = const Value.absent(),
                Value<String?> zoneId = const Value.absent(),
                Value<String?> locationType = const Value.absent(),
                Value<String?> parentStation = const Value.absent(),
                Value<int> wheelchairBoarding = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StopsCompanion(
                stopId: stopId,
                stopCode: stopCode,
                stopName: stopName,
                stopLat: stopLat,
                stopLon: stopLon,
                zoneId: zoneId,
                locationType: locationType,
                parentStation: parentStation,
                wheelchairBoarding: wheelchairBoarding,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String stopId,
                required String stopCode,
                required String stopName,
                required double stopLat,
                required double stopLon,
                Value<String?> zoneId = const Value.absent(),
                Value<String?> locationType = const Value.absent(),
                Value<String?> parentStation = const Value.absent(),
                required int wheelchairBoarding,
                Value<int> rowid = const Value.absent(),
              }) => StopsCompanion.insert(
                stopId: stopId,
                stopCode: stopCode,
                stopName: stopName,
                stopLat: stopLat,
                stopLon: stopLon,
                zoneId: zoneId,
                locationType: locationType,
                parentStation: parentStation,
                wheelchairBoarding: wheelchairBoarding,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StopsTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $StopsTable,
      Stop,
      $$StopsTableFilterComposer,
      $$StopsTableOrderingComposer,
      $$StopsTableAnnotationComposer,
      $$StopsTableCreateCompanionBuilder,
      $$StopsTableUpdateCompanionBuilder,
      (Stop, BaseReferences<_$TestDatabase, $StopsTable, Stop>),
      Stop,
      PrefetchHooks Function()
    >;
typedef $$TripsTableCreateCompanionBuilder =
    TripsCompanion Function({
      required String routeId,
      required int tripId,
      required String tripHeadsign,
      required String serviceId,
      required int directionId,
      Value<String?> shapeId,
      required int wheelchairAccessible,
      required int bikesAllowed,
      Value<int> rowid,
    });
typedef $$TripsTableUpdateCompanionBuilder =
    TripsCompanion Function({
      Value<String> routeId,
      Value<int> tripId,
      Value<String> tripHeadsign,
      Value<String> serviceId,
      Value<int> directionId,
      Value<String?> shapeId,
      Value<int> wheelchairAccessible,
      Value<int> bikesAllowed,
      Value<int> rowid,
    });

class $$TripsTableFilterComposer extends Composer<_$TestDatabase, $TripsTable> {
  $$TripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tripHeadsign => $composableBuilder(
    column: $table.tripHeadsign,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get directionId => $composableBuilder(
    column: $table.directionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shapeId => $composableBuilder(
    column: $table.shapeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wheelchairAccessible => $composableBuilder(
    column: $table.wheelchairAccessible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bikesAllowed => $composableBuilder(
    column: $table.bikesAllowed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TripsTableOrderingComposer
    extends Composer<_$TestDatabase, $TripsTable> {
  $$TripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tripHeadsign => $composableBuilder(
    column: $table.tripHeadsign,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get directionId => $composableBuilder(
    column: $table.directionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shapeId => $composableBuilder(
    column: $table.shapeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wheelchairAccessible => $composableBuilder(
    column: $table.wheelchairAccessible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bikesAllowed => $composableBuilder(
    column: $table.bikesAllowed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TripsTableAnnotationComposer
    extends Composer<_$TestDatabase, $TripsTable> {
  $$TripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get routeId =>
      $composableBuilder(column: $table.routeId, builder: (column) => column);

  GeneratedColumn<int> get tripId =>
      $composableBuilder(column: $table.tripId, builder: (column) => column);

  GeneratedColumn<String> get tripHeadsign => $composableBuilder(
    column: $table.tripHeadsign,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  GeneratedColumn<int> get directionId => $composableBuilder(
    column: $table.directionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shapeId =>
      $composableBuilder(column: $table.shapeId, builder: (column) => column);

  GeneratedColumn<int> get wheelchairAccessible => $composableBuilder(
    column: $table.wheelchairAccessible,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bikesAllowed => $composableBuilder(
    column: $table.bikesAllowed,
    builder: (column) => column,
  );
}

class $$TripsTableTableManager
    extends
        RootTableManager<
          _$TestDatabase,
          $TripsTable,
          Trip,
          $$TripsTableFilterComposer,
          $$TripsTableOrderingComposer,
          $$TripsTableAnnotationComposer,
          $$TripsTableCreateCompanionBuilder,
          $$TripsTableUpdateCompanionBuilder,
          (Trip, BaseReferences<_$TestDatabase, $TripsTable, Trip>),
          Trip,
          PrefetchHooks Function()
        > {
  $$TripsTableTableManager(_$TestDatabase db, $TripsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> routeId = const Value.absent(),
                Value<int> tripId = const Value.absent(),
                Value<String> tripHeadsign = const Value.absent(),
                Value<String> serviceId = const Value.absent(),
                Value<int> directionId = const Value.absent(),
                Value<String?> shapeId = const Value.absent(),
                Value<int> wheelchairAccessible = const Value.absent(),
                Value<int> bikesAllowed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TripsCompanion(
                routeId: routeId,
                tripId: tripId,
                tripHeadsign: tripHeadsign,
                serviceId: serviceId,
                directionId: directionId,
                shapeId: shapeId,
                wheelchairAccessible: wheelchairAccessible,
                bikesAllowed: bikesAllowed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String routeId,
                required int tripId,
                required String tripHeadsign,
                required String serviceId,
                required int directionId,
                Value<String?> shapeId = const Value.absent(),
                required int wheelchairAccessible,
                required int bikesAllowed,
                Value<int> rowid = const Value.absent(),
              }) => TripsCompanion.insert(
                routeId: routeId,
                tripId: tripId,
                tripHeadsign: tripHeadsign,
                serviceId: serviceId,
                directionId: directionId,
                shapeId: shapeId,
                wheelchairAccessible: wheelchairAccessible,
                bikesAllowed: bikesAllowed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TripsTableProcessedTableManager =
    ProcessedTableManager<
      _$TestDatabase,
      $TripsTable,
      Trip,
      $$TripsTableFilterComposer,
      $$TripsTableOrderingComposer,
      $$TripsTableAnnotationComposer,
      $$TripsTableCreateCompanionBuilder,
      $$TripsTableUpdateCompanionBuilder,
      (Trip, BaseReferences<_$TestDatabase, $TripsTable, Trip>),
      Trip,
      PrefetchHooks Function()
    >;

class $TestDatabaseManager {
  final _$TestDatabase _db;
  $TestDatabaseManager(this._db);
  $$AgencyTableTableManager get agency =>
      $$AgencyTableTableManager(_db, _db.agency);
  $$CalendarDatesTableTableManager get calendarDates =>
      $$CalendarDatesTableTableManager(_db, _db.calendarDates);
  $$FareAttributesTableTableManager get fareAttributes =>
      $$FareAttributesTableTableManager(_db, _db.fareAttributes);
  $$RoutesTableTableManager get routes =>
      $$RoutesTableTableManager(_db, _db.routes);
  $$RouteStopTableTableManager get routeStop =>
      $$RouteStopTableTableManager(_db, _db.routeStop);
  $$ShapesTableTableManager get shapes =>
      $$ShapesTableTableManager(_db, _db.shapes);
  $$StopTimesTableTableManager get stopTimes =>
      $$StopTimesTableTableManager(_db, _db.stopTimes);
  $$StopsTableTableManager get stops =>
      $$StopsTableTableManager(_db, _db.stops);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
}
