// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AgenceTransportTable extends AgenceTransport
    with TableInfo<$AgenceTransportTable, AgenceTransportData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgenceTransportTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String> nom = GeneratedColumn<String>(
    'nom',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageFileNameMeta = const VerificationMeta(
    'imageFileName',
  );
  @override
  late final GeneratedColumn<String> imageFileName = GeneratedColumn<String>(
    'image_file_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nom, imageFileName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agence_transport';
  @override
  VerificationContext validateIntegrity(
    Insertable<AgenceTransportData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nom')) {
      context.handle(
        _nomMeta,
        nom.isAcceptableOrUnknown(data['nom']!, _nomMeta),
      );
    } else if (isInserting) {
      context.missing(_nomMeta);
    }
    if (data.containsKey('image_file_name')) {
      context.handle(
        _imageFileNameMeta,
        imageFileName.isAcceptableOrUnknown(
          data['image_file_name']!,
          _imageFileNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AgenceTransportData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AgenceTransportData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nom'],
      )!,
      imageFileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_file_name'],
      ),
    );
  }

  @override
  $AgenceTransportTable createAlias(String alias) {
    return $AgenceTransportTable(attachedDatabase, alias);
  }
}

class AgenceTransportData extends DataClass
    implements Insertable<AgenceTransportData> {
  final int id;
  final String nom;
  final String? imageFileName;
  const AgenceTransportData({
    required this.id,
    required this.nom,
    this.imageFileName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nom'] = Variable<String>(nom);
    if (!nullToAbsent || imageFileName != null) {
      map['image_file_name'] = Variable<String>(imageFileName);
    }
    return map;
  }

  AgenceTransportCompanion toCompanion(bool nullToAbsent) {
    return AgenceTransportCompanion(
      id: Value(id),
      nom: Value(nom),
      imageFileName: imageFileName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageFileName),
    );
  }

  factory AgenceTransportData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AgenceTransportData(
      id: serializer.fromJson<int>(json['id']),
      nom: serializer.fromJson<String>(json['nom']),
      imageFileName: serializer.fromJson<String?>(json['imageFileName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nom': serializer.toJson<String>(nom),
      'imageFileName': serializer.toJson<String?>(imageFileName),
    };
  }

  AgenceTransportData copyWith({
    int? id,
    String? nom,
    Value<String?> imageFileName = const Value.absent(),
  }) => AgenceTransportData(
    id: id ?? this.id,
    nom: nom ?? this.nom,
    imageFileName: imageFileName.present
        ? imageFileName.value
        : this.imageFileName,
  );
  AgenceTransportData copyWithCompanion(AgenceTransportCompanion data) {
    return AgenceTransportData(
      id: data.id.present ? data.id.value : this.id,
      nom: data.nom.present ? data.nom.value : this.nom,
      imageFileName: data.imageFileName.present
          ? data.imageFileName.value
          : this.imageFileName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AgenceTransportData(')
          ..write('id: $id, ')
          ..write('nom: $nom, ')
          ..write('imageFileName: $imageFileName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nom, imageFileName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgenceTransportData &&
          other.id == this.id &&
          other.nom == this.nom &&
          other.imageFileName == this.imageFileName);
}

class AgenceTransportCompanion extends UpdateCompanion<AgenceTransportData> {
  final Value<int> id;
  final Value<String> nom;
  final Value<String?> imageFileName;
  const AgenceTransportCompanion({
    this.id = const Value.absent(),
    this.nom = const Value.absent(),
    this.imageFileName = const Value.absent(),
  });
  AgenceTransportCompanion.insert({
    this.id = const Value.absent(),
    required String nom,
    this.imageFileName = const Value.absent(),
  }) : nom = Value(nom);
  static Insertable<AgenceTransportData> custom({
    Expression<int>? id,
    Expression<String>? nom,
    Expression<String>? imageFileName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nom != null) 'nom': nom,
      if (imageFileName != null) 'image_file_name': imageFileName,
    });
  }

  AgenceTransportCompanion copyWith({
    Value<int>? id,
    Value<String>? nom,
    Value<String?>? imageFileName,
  }) {
    return AgenceTransportCompanion(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      imageFileName: imageFileName ?? this.imageFileName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String>(nom.value);
    }
    if (imageFileName.present) {
      map['image_file_name'] = Variable<String>(imageFileName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgenceTransportCompanion(')
          ..write('id: $id, ')
          ..write('nom: $nom, ')
          ..write('imageFileName: $imageFileName')
          ..write(')'))
        .toString();
  }
}

class $ReseauTable extends Reseau with TableInfo<$ReseauTable, ReseauData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReseauTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agenceTransportIdMeta = const VerificationMeta(
    'agenceTransportId',
  );
  @override
  late final GeneratedColumn<int> agenceTransportId = GeneratedColumn<int>(
    'agence_transport_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES agence_transport (id)',
    ),
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textColorMeta = const VerificationMeta(
    'textColor',
  );
  @override
  late final GeneratedColumn<String> textColor = GeneratedColumn<String>(
    'text_color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageFileNameMeta = const VerificationMeta(
    'imageFileName',
  );
  @override
  late final GeneratedColumn<String> imageFileName = GeneratedColumn<String>(
    'image_file_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    agenceTransportId,
    mode,
    textColor,
    imageFileName,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reseau';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReseauData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('agence_transport_id')) {
      context.handle(
        _agenceTransportIdMeta,
        agenceTransportId.isAcceptableOrUnknown(
          data['agence_transport_id']!,
          _agenceTransportIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_agenceTransportIdMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('text_color')) {
      context.handle(
        _textColorMeta,
        textColor.isAcceptableOrUnknown(data['text_color']!, _textColorMeta),
      );
    }
    if (data.containsKey('image_file_name')) {
      context.handle(
        _imageFileNameMeta,
        imageFileName.isAcceptableOrUnknown(
          data['image_file_name']!,
          _imageFileNameMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReseauData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReseauData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      agenceTransportId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agence_transport_id'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      textColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_color'],
      ),
      imageFileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_file_name'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ReseauTable createAlias(String alias) {
    return $ReseauTable(attachedDatabase, alias);
  }
}

class ReseauData extends DataClass implements Insertable<ReseauData> {
  final String id;
  final int agenceTransportId;
  final String mode;
  final String? textColor;
  final String? imageFileName;
  final String? description;
  const ReseauData({
    required this.id,
    required this.agenceTransportId,
    required this.mode,
    this.textColor,
    this.imageFileName,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['agence_transport_id'] = Variable<int>(agenceTransportId);
    map['mode'] = Variable<String>(mode);
    if (!nullToAbsent || textColor != null) {
      map['text_color'] = Variable<String>(textColor);
    }
    if (!nullToAbsent || imageFileName != null) {
      map['image_file_name'] = Variable<String>(imageFileName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ReseauCompanion toCompanion(bool nullToAbsent) {
    return ReseauCompanion(
      id: Value(id),
      agenceTransportId: Value(agenceTransportId),
      mode: Value(mode),
      textColor: textColor == null && nullToAbsent
          ? const Value.absent()
          : Value(textColor),
      imageFileName: imageFileName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageFileName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory ReseauData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReseauData(
      id: serializer.fromJson<String>(json['id']),
      agenceTransportId: serializer.fromJson<int>(json['agenceTransportId']),
      mode: serializer.fromJson<String>(json['mode']),
      textColor: serializer.fromJson<String?>(json['textColor']),
      imageFileName: serializer.fromJson<String?>(json['imageFileName']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'agenceTransportId': serializer.toJson<int>(agenceTransportId),
      'mode': serializer.toJson<String>(mode),
      'textColor': serializer.toJson<String?>(textColor),
      'imageFileName': serializer.toJson<String?>(imageFileName),
      'description': serializer.toJson<String?>(description),
    };
  }

  ReseauData copyWith({
    String? id,
    int? agenceTransportId,
    String? mode,
    Value<String?> textColor = const Value.absent(),
    Value<String?> imageFileName = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => ReseauData(
    id: id ?? this.id,
    agenceTransportId: agenceTransportId ?? this.agenceTransportId,
    mode: mode ?? this.mode,
    textColor: textColor.present ? textColor.value : this.textColor,
    imageFileName: imageFileName.present
        ? imageFileName.value
        : this.imageFileName,
    description: description.present ? description.value : this.description,
  );
  ReseauData copyWithCompanion(ReseauCompanion data) {
    return ReseauData(
      id: data.id.present ? data.id.value : this.id,
      agenceTransportId: data.agenceTransportId.present
          ? data.agenceTransportId.value
          : this.agenceTransportId,
      mode: data.mode.present ? data.mode.value : this.mode,
      textColor: data.textColor.present ? data.textColor.value : this.textColor,
      imageFileName: data.imageFileName.present
          ? data.imageFileName.value
          : this.imageFileName,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReseauData(')
          ..write('id: $id, ')
          ..write('agenceTransportId: $agenceTransportId, ')
          ..write('mode: $mode, ')
          ..write('textColor: $textColor, ')
          ..write('imageFileName: $imageFileName, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    agenceTransportId,
    mode,
    textColor,
    imageFileName,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReseauData &&
          other.id == this.id &&
          other.agenceTransportId == this.agenceTransportId &&
          other.mode == this.mode &&
          other.textColor == this.textColor &&
          other.imageFileName == this.imageFileName &&
          other.description == this.description);
}

class ReseauCompanion extends UpdateCompanion<ReseauData> {
  final Value<String> id;
  final Value<int> agenceTransportId;
  final Value<String> mode;
  final Value<String?> textColor;
  final Value<String?> imageFileName;
  final Value<String?> description;
  final Value<int> rowid;
  const ReseauCompanion({
    this.id = const Value.absent(),
    this.agenceTransportId = const Value.absent(),
    this.mode = const Value.absent(),
    this.textColor = const Value.absent(),
    this.imageFileName = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReseauCompanion.insert({
    required String id,
    required int agenceTransportId,
    required String mode,
    this.textColor = const Value.absent(),
    this.imageFileName = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       agenceTransportId = Value(agenceTransportId),
       mode = Value(mode);
  static Insertable<ReseauData> custom({
    Expression<String>? id,
    Expression<int>? agenceTransportId,
    Expression<String>? mode,
    Expression<String>? textColor,
    Expression<String>? imageFileName,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (agenceTransportId != null) 'agence_transport_id': agenceTransportId,
      if (mode != null) 'mode': mode,
      if (textColor != null) 'text_color': textColor,
      if (imageFileName != null) 'image_file_name': imageFileName,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReseauCompanion copyWith({
    Value<String>? id,
    Value<int>? agenceTransportId,
    Value<String>? mode,
    Value<String?>? textColor,
    Value<String?>? imageFileName,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return ReseauCompanion(
      id: id ?? this.id,
      agenceTransportId: agenceTransportId ?? this.agenceTransportId,
      mode: mode ?? this.mode,
      textColor: textColor ?? this.textColor,
      imageFileName: imageFileName ?? this.imageFileName,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (agenceTransportId.present) {
      map['agence_transport_id'] = Variable<int>(agenceTransportId.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (textColor.present) {
      map['text_color'] = Variable<String>(textColor.value);
    }
    if (imageFileName.present) {
      map['image_file_name'] = Variable<String>(imageFileName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReseauCompanion(')
          ..write('id: $id, ')
          ..write('agenceTransportId: $agenceTransportId, ')
          ..write('mode: $mode, ')
          ..write('textColor: $textColor, ')
          ..write('imageFileName: $imageFileName, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LigneTable extends Ligne with TableInfo<$LigneTable, LigneData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LigneTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reseauIdMeta = const VerificationMeta(
    'reseauId',
  );
  @override
  late final GeneratedColumn<String> reseauId = GeneratedColumn<String>(
    'reseau_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reseau (id)',
    ),
  );
  static const VerificationMeta _gtfsIdMeta = const VerificationMeta('gtfsId');
  @override
  late final GeneratedColumn<String> gtfsId = GeneratedColumn<String>(
    'gtfs_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shortNameMeta = const VerificationMeta(
    'shortName',
  );
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
    'short_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longNameMeta = const VerificationMeta(
    'longName',
  );
  @override
  late final GeneratedColumn<String> longName = GeneratedColumn<String>(
    'long_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reseauId,
    gtfsId,
    shortName,
    longName,
    color,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ligne';
  @override
  VerificationContext validateIntegrity(
    Insertable<LigneData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reseau_id')) {
      context.handle(
        _reseauIdMeta,
        reseauId.isAcceptableOrUnknown(data['reseau_id']!, _reseauIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reseauIdMeta);
    }
    if (data.containsKey('gtfs_id')) {
      context.handle(
        _gtfsIdMeta,
        gtfsId.isAcceptableOrUnknown(data['gtfs_id']!, _gtfsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gtfsIdMeta);
    }
    if (data.containsKey('short_name')) {
      context.handle(
        _shortNameMeta,
        shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta),
      );
    }
    if (data.containsKey('long_name')) {
      context.handle(
        _longNameMeta,
        longName.isAcceptableOrUnknown(data['long_name']!, _longNameMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LigneData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LigneData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      reseauId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reseau_id'],
      )!,
      gtfsId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gtfs_id'],
      )!,
      shortName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_name'],
      ),
      longName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}long_name'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
    );
  }

  @override
  $LigneTable createAlias(String alias) {
    return $LigneTable(attachedDatabase, alias);
  }
}

class LigneData extends DataClass implements Insertable<LigneData> {
  final String id;
  final String reseauId;
  final String gtfsId;
  final String? shortName;
  final String? longName;
  final String? color;
  const LigneData({
    required this.id,
    required this.reseauId,
    required this.gtfsId,
    this.shortName,
    this.longName,
    this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['reseau_id'] = Variable<String>(reseauId);
    map['gtfs_id'] = Variable<String>(gtfsId);
    if (!nullToAbsent || shortName != null) {
      map['short_name'] = Variable<String>(shortName);
    }
    if (!nullToAbsent || longName != null) {
      map['long_name'] = Variable<String>(longName);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    return map;
  }

  LigneCompanion toCompanion(bool nullToAbsent) {
    return LigneCompanion(
      id: Value(id),
      reseauId: Value(reseauId),
      gtfsId: Value(gtfsId),
      shortName: shortName == null && nullToAbsent
          ? const Value.absent()
          : Value(shortName),
      longName: longName == null && nullToAbsent
          ? const Value.absent()
          : Value(longName),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
    );
  }

  factory LigneData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LigneData(
      id: serializer.fromJson<String>(json['id']),
      reseauId: serializer.fromJson<String>(json['reseauId']),
      gtfsId: serializer.fromJson<String>(json['gtfsId']),
      shortName: serializer.fromJson<String?>(json['shortName']),
      longName: serializer.fromJson<String?>(json['longName']),
      color: serializer.fromJson<String?>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'reseauId': serializer.toJson<String>(reseauId),
      'gtfsId': serializer.toJson<String>(gtfsId),
      'shortName': serializer.toJson<String?>(shortName),
      'longName': serializer.toJson<String?>(longName),
      'color': serializer.toJson<String?>(color),
    };
  }

  LigneData copyWith({
    String? id,
    String? reseauId,
    String? gtfsId,
    Value<String?> shortName = const Value.absent(),
    Value<String?> longName = const Value.absent(),
    Value<String?> color = const Value.absent(),
  }) => LigneData(
    id: id ?? this.id,
    reseauId: reseauId ?? this.reseauId,
    gtfsId: gtfsId ?? this.gtfsId,
    shortName: shortName.present ? shortName.value : this.shortName,
    longName: longName.present ? longName.value : this.longName,
    color: color.present ? color.value : this.color,
  );
  LigneData copyWithCompanion(LigneCompanion data) {
    return LigneData(
      id: data.id.present ? data.id.value : this.id,
      reseauId: data.reseauId.present ? data.reseauId.value : this.reseauId,
      gtfsId: data.gtfsId.present ? data.gtfsId.value : this.gtfsId,
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
      longName: data.longName.present ? data.longName.value : this.longName,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LigneData(')
          ..write('id: $id, ')
          ..write('reseauId: $reseauId, ')
          ..write('gtfsId: $gtfsId, ')
          ..write('shortName: $shortName, ')
          ..write('longName: $longName, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, reseauId, gtfsId, shortName, longName, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LigneData &&
          other.id == this.id &&
          other.reseauId == this.reseauId &&
          other.gtfsId == this.gtfsId &&
          other.shortName == this.shortName &&
          other.longName == this.longName &&
          other.color == this.color);
}

class LigneCompanion extends UpdateCompanion<LigneData> {
  final Value<String> id;
  final Value<String> reseauId;
  final Value<String> gtfsId;
  final Value<String?> shortName;
  final Value<String?> longName;
  final Value<String?> color;
  final Value<int> rowid;
  const LigneCompanion({
    this.id = const Value.absent(),
    this.reseauId = const Value.absent(),
    this.gtfsId = const Value.absent(),
    this.shortName = const Value.absent(),
    this.longName = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LigneCompanion.insert({
    required String id,
    required String reseauId,
    required String gtfsId,
    this.shortName = const Value.absent(),
    this.longName = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       reseauId = Value(reseauId),
       gtfsId = Value(gtfsId);
  static Insertable<LigneData> custom({
    Expression<String>? id,
    Expression<String>? reseauId,
    Expression<String>? gtfsId,
    Expression<String>? shortName,
    Expression<String>? longName,
    Expression<String>? color,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reseauId != null) 'reseau_id': reseauId,
      if (gtfsId != null) 'gtfs_id': gtfsId,
      if (shortName != null) 'short_name': shortName,
      if (longName != null) 'long_name': longName,
      if (color != null) 'color': color,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LigneCompanion copyWith({
    Value<String>? id,
    Value<String>? reseauId,
    Value<String>? gtfsId,
    Value<String?>? shortName,
    Value<String?>? longName,
    Value<String?>? color,
    Value<int>? rowid,
  }) {
    return LigneCompanion(
      id: id ?? this.id,
      reseauId: reseauId ?? this.reseauId,
      gtfsId: gtfsId ?? this.gtfsId,
      shortName: shortName ?? this.shortName,
      longName: longName ?? this.longName,
      color: color ?? this.color,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reseauId.present) {
      map['reseau_id'] = Variable<String>(reseauId.value);
    }
    if (gtfsId.present) {
      map['gtfs_id'] = Variable<String>(gtfsId.value);
    }
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
    }
    if (longName.present) {
      map['long_name'] = Variable<String>(longName.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LigneCompanion(')
          ..write('id: $id, ')
          ..write('reseauId: $reseauId, ')
          ..write('gtfsId: $gtfsId, ')
          ..write('shortName: $shortName, ')
          ..write('longName: $longName, ')
          ..write('color: $color, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LignePolyTable extends LignePoly
    with TableInfo<$LignePolyTable, LignePolyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LignePolyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ligneIdMeta = const VerificationMeta(
    'ligneId',
  );
  @override
  late final GeneratedColumn<String> ligneId = GeneratedColumn<String>(
    'ligne_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ligne (id)',
    ),
  );
  static const VerificationMeta _numMeta = const VerificationMeta('num');
  @override
  late final GeneratedColumn<int> num = GeneratedColumn<int>(
    'num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [ligneId, num, lat, lon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ligne_poly';
  @override
  VerificationContext validateIntegrity(
    Insertable<LignePolyData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ligne_id')) {
      context.handle(
        _ligneIdMeta,
        ligneId.isAcceptableOrUnknown(data['ligne_id']!, _ligneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ligneIdMeta);
    }
    if (data.containsKey('num')) {
      context.handle(
        _numMeta,
        num.isAcceptableOrUnknown(data['num']!, _numMeta),
      );
    } else if (isInserting) {
      context.missing(_numMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ligneId, lat, lon};
  @override
  LignePolyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LignePolyData(
      ligneId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ligne_id'],
      )!,
      num: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}num'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      )!,
    );
  }

  @override
  $LignePolyTable createAlias(String alias) {
    return $LignePolyTable(attachedDatabase, alias);
  }
}

class LignePolyData extends DataClass implements Insertable<LignePolyData> {
  final String ligneId;
  final int num;
  final double lat;
  final double lon;
  const LignePolyData({
    required this.ligneId,
    required this.num,
    required this.lat,
    required this.lon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ligne_id'] = Variable<String>(ligneId);
    map['num'] = Variable<int>(num);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    return map;
  }

  LignePolyCompanion toCompanion(bool nullToAbsent) {
    return LignePolyCompanion(
      ligneId: Value(ligneId),
      num: Value(num),
      lat: Value(lat),
      lon: Value(lon),
    );
  }

  factory LignePolyData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LignePolyData(
      ligneId: serializer.fromJson<String>(json['ligneId']),
      num: serializer.fromJson<int>(json['num']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ligneId': serializer.toJson<String>(ligneId),
      'num': serializer.toJson<int>(num),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
    };
  }

  LignePolyData copyWith({
    String? ligneId,
    int? num,
    double? lat,
    double? lon,
  }) => LignePolyData(
    ligneId: ligneId ?? this.ligneId,
    num: num ?? this.num,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
  );
  LignePolyData copyWithCompanion(LignePolyCompanion data) {
    return LignePolyData(
      ligneId: data.ligneId.present ? data.ligneId.value : this.ligneId,
      num: data.num.present ? data.num.value : this.num,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LignePolyData(')
          ..write('ligneId: $ligneId, ')
          ..write('num: $num, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ligneId, num, lat, lon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LignePolyData &&
          other.ligneId == this.ligneId &&
          other.num == this.num &&
          other.lat == this.lat &&
          other.lon == this.lon);
}

class LignePolyCompanion extends UpdateCompanion<LignePolyData> {
  final Value<String> ligneId;
  final Value<int> num;
  final Value<double> lat;
  final Value<double> lon;
  final Value<int> rowid;
  const LignePolyCompanion({
    this.ligneId = const Value.absent(),
    this.num = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LignePolyCompanion.insert({
    required String ligneId,
    required int num,
    required double lat,
    required double lon,
    this.rowid = const Value.absent(),
  }) : ligneId = Value(ligneId),
       num = Value(num),
       lat = Value(lat),
       lon = Value(lon);
  static Insertable<LignePolyData> custom({
    Expression<String>? ligneId,
    Expression<int>? num,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ligneId != null) 'ligne_id': ligneId,
      if (num != null) 'num': num,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LignePolyCompanion copyWith({
    Value<String>? ligneId,
    Value<int>? num,
    Value<double>? lat,
    Value<double>? lon,
    Value<int>? rowid,
  }) {
    return LignePolyCompanion(
      ligneId: ligneId ?? this.ligneId,
      num: num ?? this.num,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ligneId.present) {
      map['ligne_id'] = Variable<String>(ligneId.value);
    }
    if (num.present) {
      map['num'] = Variable<int>(num.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LignePolyCompanion(')
          ..write('ligneId: $ligneId, ')
          ..write('num: $num, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArretTable extends Arret with TableInfo<$ArretTable, ArretData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArretTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numMeta = const VerificationMeta('num');
  @override
  late final GeneratedColumn<int> num = GeneratedColumn<int>(
    'num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visibleMeta = const VerificationMeta(
    'visible',
  );
  @override
  late final GeneratedColumn<bool> visible = GeneratedColumn<bool>(
    'visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("visible" IN (0, 1))',
    ),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    num,
    code,
    city,
    name,
    visible,
    lat,
    lon,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'arret';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArretData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('num')) {
      context.handle(
        _numMeta,
        num.isAcceptableOrUnknown(data['num']!, _numMeta),
      );
    } else if (isInserting) {
      context.missing(_numMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('visible')) {
      context.handle(
        _visibleMeta,
        visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta),
      );
    } else if (isInserting) {
      context.missing(_visibleMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArretData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArretData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      num: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}num'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      visible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}visible'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      )!,
    );
  }

  @override
  $ArretTable createAlias(String alias) {
    return $ArretTable(attachedDatabase, alias);
  }
}

class ArretData extends DataClass implements Insertable<ArretData> {
  final String id;
  final int num;
  final String code;
  final String? city;
  final String name;
  final bool visible;
  final double lat;
  final double lon;
  const ArretData({
    required this.id,
    required this.num,
    required this.code,
    this.city,
    required this.name,
    required this.visible,
    required this.lat,
    required this.lon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['num'] = Variable<int>(num);
    map['code'] = Variable<String>(code);
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['name'] = Variable<String>(name);
    map['visible'] = Variable<bool>(visible);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    return map;
  }

  ArretCompanion toCompanion(bool nullToAbsent) {
    return ArretCompanion(
      id: Value(id),
      num: Value(num),
      code: Value(code),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      name: Value(name),
      visible: Value(visible),
      lat: Value(lat),
      lon: Value(lon),
    );
  }

  factory ArretData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArretData(
      id: serializer.fromJson<String>(json['id']),
      num: serializer.fromJson<int>(json['num']),
      code: serializer.fromJson<String>(json['code']),
      city: serializer.fromJson<String?>(json['city']),
      name: serializer.fromJson<String>(json['name']),
      visible: serializer.fromJson<bool>(json['visible']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'num': serializer.toJson<int>(num),
      'code': serializer.toJson<String>(code),
      'city': serializer.toJson<String?>(city),
      'name': serializer.toJson<String>(name),
      'visible': serializer.toJson<bool>(visible),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
    };
  }

  ArretData copyWith({
    String? id,
    int? num,
    String? code,
    Value<String?> city = const Value.absent(),
    String? name,
    bool? visible,
    double? lat,
    double? lon,
  }) => ArretData(
    id: id ?? this.id,
    num: num ?? this.num,
    code: code ?? this.code,
    city: city.present ? city.value : this.city,
    name: name ?? this.name,
    visible: visible ?? this.visible,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
  );
  ArretData copyWithCompanion(ArretCompanion data) {
    return ArretData(
      id: data.id.present ? data.id.value : this.id,
      num: data.num.present ? data.num.value : this.num,
      code: data.code.present ? data.code.value : this.code,
      city: data.city.present ? data.city.value : this.city,
      name: data.name.present ? data.name.value : this.name,
      visible: data.visible.present ? data.visible.value : this.visible,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArretData(')
          ..write('id: $id, ')
          ..write('num: $num, ')
          ..write('code: $code, ')
          ..write('city: $city, ')
          ..write('name: $name, ')
          ..write('visible: $visible, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, num, code, city, name, visible, lat, lon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArretData &&
          other.id == this.id &&
          other.num == this.num &&
          other.code == this.code &&
          other.city == this.city &&
          other.name == this.name &&
          other.visible == this.visible &&
          other.lat == this.lat &&
          other.lon == this.lon);
}

class ArretCompanion extends UpdateCompanion<ArretData> {
  final Value<String> id;
  final Value<int> num;
  final Value<String> code;
  final Value<String?> city;
  final Value<String> name;
  final Value<bool> visible;
  final Value<double> lat;
  final Value<double> lon;
  final Value<int> rowid;
  const ArretCompanion({
    this.id = const Value.absent(),
    this.num = const Value.absent(),
    this.code = const Value.absent(),
    this.city = const Value.absent(),
    this.name = const Value.absent(),
    this.visible = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArretCompanion.insert({
    required String id,
    required int num,
    required String code,
    this.city = const Value.absent(),
    required String name,
    required bool visible,
    required double lat,
    required double lon,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       num = Value(num),
       code = Value(code),
       name = Value(name),
       visible = Value(visible),
       lat = Value(lat),
       lon = Value(lon);
  static Insertable<ArretData> custom({
    Expression<String>? id,
    Expression<int>? num,
    Expression<String>? code,
    Expression<String>? city,
    Expression<String>? name,
    Expression<bool>? visible,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (num != null) 'num': num,
      if (code != null) 'code': code,
      if (city != null) 'city': city,
      if (name != null) 'name': name,
      if (visible != null) 'visible': visible,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArretCompanion copyWith({
    Value<String>? id,
    Value<int>? num,
    Value<String>? code,
    Value<String?>? city,
    Value<String>? name,
    Value<bool>? visible,
    Value<double>? lat,
    Value<double>? lon,
    Value<int>? rowid,
  }) {
    return ArretCompanion(
      id: id ?? this.id,
      num: num ?? this.num,
      code: code ?? this.code,
      city: city ?? this.city,
      name: name ?? this.name,
      visible: visible ?? this.visible,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (num.present) {
      map['num'] = Variable<int>(num.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArretCompanion(')
          ..write('id: $id, ')
          ..write('num: $num, ')
          ..write('code: $code, ')
          ..write('city: $city, ')
          ..write('name: $name, ')
          ..write('visible: $visible, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PoteauTable extends Poteau with TableInfo<$PoteauTable, PoteauData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PoteauTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visibleMeta = const VerificationMeta(
    'visible',
  );
  @override
  late final GeneratedColumn<bool> visible = GeneratedColumn<bool>(
    'visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("visible" IN (0, 1))',
    ),
  );
  static const VerificationMeta _arretIdMeta = const VerificationMeta(
    'arretId',
  );
  @override
  late final GeneratedColumn<String> arretId = GeneratedColumn<String>(
    'arret_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES arret (id)',
    ),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, visible, arretId, lat, lon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'poteau';
  @override
  VerificationContext validateIntegrity(
    Insertable<PoteauData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('visible')) {
      context.handle(
        _visibleMeta,
        visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta),
      );
    } else if (isInserting) {
      context.missing(_visibleMeta);
    }
    if (data.containsKey('arret_id')) {
      context.handle(
        _arretIdMeta,
        arretId.isAcceptableOrUnknown(data['arret_id']!, _arretIdMeta),
      );
    } else if (isInserting) {
      context.missing(_arretIdMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PoteauData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PoteauData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      visible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}visible'],
      )!,
      arretId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arret_id'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      )!,
    );
  }

  @override
  $PoteauTable createAlias(String alias) {
    return $PoteauTable(attachedDatabase, alias);
  }
}

class PoteauData extends DataClass implements Insertable<PoteauData> {
  final String id;
  final String code;
  final bool visible;
  final String arretId;
  final double lat;
  final double lon;
  const PoteauData({
    required this.id,
    required this.code,
    required this.visible,
    required this.arretId,
    required this.lat,
    required this.lon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['visible'] = Variable<bool>(visible);
    map['arret_id'] = Variable<String>(arretId);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    return map;
  }

  PoteauCompanion toCompanion(bool nullToAbsent) {
    return PoteauCompanion(
      id: Value(id),
      code: Value(code),
      visible: Value(visible),
      arretId: Value(arretId),
      lat: Value(lat),
      lon: Value(lon),
    );
  }

  factory PoteauData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PoteauData(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      visible: serializer.fromJson<bool>(json['visible']),
      arretId: serializer.fromJson<String>(json['arretId']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'visible': serializer.toJson<bool>(visible),
      'arretId': serializer.toJson<String>(arretId),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
    };
  }

  PoteauData copyWith({
    String? id,
    String? code,
    bool? visible,
    String? arretId,
    double? lat,
    double? lon,
  }) => PoteauData(
    id: id ?? this.id,
    code: code ?? this.code,
    visible: visible ?? this.visible,
    arretId: arretId ?? this.arretId,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
  );
  PoteauData copyWithCompanion(PoteauCompanion data) {
    return PoteauData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      visible: data.visible.present ? data.visible.value : this.visible,
      arretId: data.arretId.present ? data.arretId.value : this.arretId,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PoteauData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('visible: $visible, ')
          ..write('arretId: $arretId, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, visible, arretId, lat, lon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PoteauData &&
          other.id == this.id &&
          other.code == this.code &&
          other.visible == this.visible &&
          other.arretId == this.arretId &&
          other.lat == this.lat &&
          other.lon == this.lon);
}

class PoteauCompanion extends UpdateCompanion<PoteauData> {
  final Value<String> id;
  final Value<String> code;
  final Value<bool> visible;
  final Value<String> arretId;
  final Value<double> lat;
  final Value<double> lon;
  final Value<int> rowid;
  const PoteauCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.visible = const Value.absent(),
    this.arretId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PoteauCompanion.insert({
    required String id,
    required String code,
    required bool visible,
    required String arretId,
    required double lat,
    required double lon,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       visible = Value(visible),
       arretId = Value(arretId),
       lat = Value(lat),
       lon = Value(lon);
  static Insertable<PoteauData> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<bool>? visible,
    Expression<String>? arretId,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (visible != null) 'visible': visible,
      if (arretId != null) 'arret_id': arretId,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PoteauCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<bool>? visible,
    Value<String>? arretId,
    Value<double>? lat,
    Value<double>? lon,
    Value<int>? rowid,
  }) {
    return PoteauCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      visible: visible ?? this.visible,
      arretId: arretId ?? this.arretId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    if (arretId.present) {
      map['arret_id'] = Variable<String>(arretId.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PoteauCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('visible: $visible, ')
          ..write('arretId: $arretId, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PoteauLigneTable extends PoteauLigne
    with TableInfo<$PoteauLigneTable, PoteauLigneData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PoteauLigneTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _poteauIdMeta = const VerificationMeta(
    'poteauId',
  );
  @override
  late final GeneratedColumn<String> poteauId = GeneratedColumn<String>(
    'poteau_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES poteau (id)',
    ),
  );
  static const VerificationMeta _ligneIdMeta = const VerificationMeta(
    'ligneId',
  );
  @override
  late final GeneratedColumn<String> ligneId = GeneratedColumn<String>(
    'ligne_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ligne (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [poteauId, ligneId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'poteau_ligne';
  @override
  VerificationContext validateIntegrity(
    Insertable<PoteauLigneData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('poteau_id')) {
      context.handle(
        _poteauIdMeta,
        poteauId.isAcceptableOrUnknown(data['poteau_id']!, _poteauIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poteauIdMeta);
    }
    if (data.containsKey('ligne_id')) {
      context.handle(
        _ligneIdMeta,
        ligneId.isAcceptableOrUnknown(data['ligne_id']!, _ligneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ligneIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {poteauId, ligneId};
  @override
  PoteauLigneData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PoteauLigneData(
      poteauId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poteau_id'],
      )!,
      ligneId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ligne_id'],
      )!,
    );
  }

  @override
  $PoteauLigneTable createAlias(String alias) {
    return $PoteauLigneTable(attachedDatabase, alias);
  }
}

class PoteauLigneData extends DataClass implements Insertable<PoteauLigneData> {
  final String poteauId;
  final String ligneId;
  const PoteauLigneData({required this.poteauId, required this.ligneId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['poteau_id'] = Variable<String>(poteauId);
    map['ligne_id'] = Variable<String>(ligneId);
    return map;
  }

  PoteauLigneCompanion toCompanion(bool nullToAbsent) {
    return PoteauLigneCompanion(
      poteauId: Value(poteauId),
      ligneId: Value(ligneId),
    );
  }

  factory PoteauLigneData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PoteauLigneData(
      poteauId: serializer.fromJson<String>(json['poteauId']),
      ligneId: serializer.fromJson<String>(json['ligneId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'poteauId': serializer.toJson<String>(poteauId),
      'ligneId': serializer.toJson<String>(ligneId),
    };
  }

  PoteauLigneData copyWith({String? poteauId, String? ligneId}) =>
      PoteauLigneData(
        poteauId: poteauId ?? this.poteauId,
        ligneId: ligneId ?? this.ligneId,
      );
  PoteauLigneData copyWithCompanion(PoteauLigneCompanion data) {
    return PoteauLigneData(
      poteauId: data.poteauId.present ? data.poteauId.value : this.poteauId,
      ligneId: data.ligneId.present ? data.ligneId.value : this.ligneId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PoteauLigneData(')
          ..write('poteauId: $poteauId, ')
          ..write('ligneId: $ligneId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(poteauId, ligneId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PoteauLigneData &&
          other.poteauId == this.poteauId &&
          other.ligneId == this.ligneId);
}

class PoteauLigneCompanion extends UpdateCompanion<PoteauLigneData> {
  final Value<String> poteauId;
  final Value<String> ligneId;
  final Value<int> rowid;
  const PoteauLigneCompanion({
    this.poteauId = const Value.absent(),
    this.ligneId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PoteauLigneCompanion.insert({
    required String poteauId,
    required String ligneId,
    this.rowid = const Value.absent(),
  }) : poteauId = Value(poteauId),
       ligneId = Value(ligneId);
  static Insertable<PoteauLigneData> custom({
    Expression<String>? poteauId,
    Expression<String>? ligneId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (poteauId != null) 'poteau_id': poteauId,
      if (ligneId != null) 'ligne_id': ligneId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PoteauLigneCompanion copyWith({
    Value<String>? poteauId,
    Value<String>? ligneId,
    Value<int>? rowid,
  }) {
    return PoteauLigneCompanion(
      poteauId: poteauId ?? this.poteauId,
      ligneId: ligneId ?? this.ligneId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (poteauId.present) {
      map['poteau_id'] = Variable<String>(poteauId.value);
    }
    if (ligneId.present) {
      map['ligne_id'] = Variable<String>(ligneId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PoteauLigneCompanion(')
          ..write('poteauId: $poteauId, ')
          ..write('ligneId: $ligneId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AgenceTransportTable agenceTransport = $AgenceTransportTable(
    this,
  );
  late final $ReseauTable reseau = $ReseauTable(this);
  late final $LigneTable ligne = $LigneTable(this);
  late final $LignePolyTable lignePoly = $LignePolyTable(this);
  late final $ArretTable arret = $ArretTable(this);
  late final $PoteauTable poteau = $PoteauTable(this);
  late final $PoteauLigneTable poteauLigne = $PoteauLigneTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    agenceTransport,
    reseau,
    ligne,
    lignePoly,
    arret,
    poteau,
    poteauLigne,
  ];
}

typedef $$AgenceTransportTableCreateCompanionBuilder =
    AgenceTransportCompanion Function({
      Value<int> id,
      required String nom,
      Value<String?> imageFileName,
    });
typedef $$AgenceTransportTableUpdateCompanionBuilder =
    AgenceTransportCompanion Function({
      Value<int> id,
      Value<String> nom,
      Value<String?> imageFileName,
    });

final class $$AgenceTransportTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AgenceTransportTable,
          AgenceTransportData
        > {
  $$AgenceTransportTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ReseauTable, List<ReseauData>> _reseauRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reseau,
    aliasName: $_aliasNameGenerator(
      db.agenceTransport.id,
      db.reseau.agenceTransportId,
    ),
  );

  $$ReseauTableProcessedTableManager get reseauRefs {
    final manager = $$ReseauTableTableManager(
      $_db,
      $_db.reseau,
    ).filter((f) => f.agenceTransportId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reseauRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AgenceTransportTableFilterComposer
    extends Composer<_$AppDatabase, $AgenceTransportTable> {
  $$AgenceTransportTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageFileName => $composableBuilder(
    column: $table.imageFileName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reseauRefs(
    Expression<bool> Function($$ReseauTableFilterComposer f) f,
  ) {
    final $$ReseauTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reseau,
      getReferencedColumn: (t) => t.agenceTransportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReseauTableFilterComposer(
            $db: $db,
            $table: $db.reseau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AgenceTransportTableOrderingComposer
    extends Composer<_$AppDatabase, $AgenceTransportTable> {
  $$AgenceTransportTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageFileName => $composableBuilder(
    column: $table.imageFileName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AgenceTransportTableAnnotationComposer
    extends Composer<_$AppDatabase, $AgenceTransportTable> {
  $$AgenceTransportTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nom =>
      $composableBuilder(column: $table.nom, builder: (column) => column);

  GeneratedColumn<String> get imageFileName => $composableBuilder(
    column: $table.imageFileName,
    builder: (column) => column,
  );

  Expression<T> reseauRefs<T extends Object>(
    Expression<T> Function($$ReseauTableAnnotationComposer a) f,
  ) {
    final $$ReseauTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reseau,
      getReferencedColumn: (t) => t.agenceTransportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReseauTableAnnotationComposer(
            $db: $db,
            $table: $db.reseau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AgenceTransportTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AgenceTransportTable,
          AgenceTransportData,
          $$AgenceTransportTableFilterComposer,
          $$AgenceTransportTableOrderingComposer,
          $$AgenceTransportTableAnnotationComposer,
          $$AgenceTransportTableCreateCompanionBuilder,
          $$AgenceTransportTableUpdateCompanionBuilder,
          (AgenceTransportData, $$AgenceTransportTableReferences),
          AgenceTransportData,
          PrefetchHooks Function({bool reseauRefs})
        > {
  $$AgenceTransportTableTableManager(
    _$AppDatabase db,
    $AgenceTransportTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AgenceTransportTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AgenceTransportTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AgenceTransportTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nom = const Value.absent(),
                Value<String?> imageFileName = const Value.absent(),
              }) => AgenceTransportCompanion(
                id: id,
                nom: nom,
                imageFileName: imageFileName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nom,
                Value<String?> imageFileName = const Value.absent(),
              }) => AgenceTransportCompanion.insert(
                id: id,
                nom: nom,
                imageFileName: imageFileName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AgenceTransportTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reseauRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (reseauRefs) db.reseau],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reseauRefs)
                    await $_getPrefetchedData<
                      AgenceTransportData,
                      $AgenceTransportTable,
                      ReseauData
                    >(
                      currentTable: table,
                      referencedTable: $$AgenceTransportTableReferences
                          ._reseauRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AgenceTransportTableReferences(
                            db,
                            table,
                            p0,
                          ).reseauRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.agenceTransportId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AgenceTransportTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AgenceTransportTable,
      AgenceTransportData,
      $$AgenceTransportTableFilterComposer,
      $$AgenceTransportTableOrderingComposer,
      $$AgenceTransportTableAnnotationComposer,
      $$AgenceTransportTableCreateCompanionBuilder,
      $$AgenceTransportTableUpdateCompanionBuilder,
      (AgenceTransportData, $$AgenceTransportTableReferences),
      AgenceTransportData,
      PrefetchHooks Function({bool reseauRefs})
    >;
typedef $$ReseauTableCreateCompanionBuilder =
    ReseauCompanion Function({
      required String id,
      required int agenceTransportId,
      required String mode,
      Value<String?> textColor,
      Value<String?> imageFileName,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$ReseauTableUpdateCompanionBuilder =
    ReseauCompanion Function({
      Value<String> id,
      Value<int> agenceTransportId,
      Value<String> mode,
      Value<String?> textColor,
      Value<String?> imageFileName,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$ReseauTableReferences
    extends BaseReferences<_$AppDatabase, $ReseauTable, ReseauData> {
  $$ReseauTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AgenceTransportTable _agenceTransportIdTable(_$AppDatabase db) =>
      db.agenceTransport.createAlias(
        $_aliasNameGenerator(
          db.reseau.agenceTransportId,
          db.agenceTransport.id,
        ),
      );

  $$AgenceTransportTableProcessedTableManager get agenceTransportId {
    final $_column = $_itemColumn<int>('agence_transport_id')!;

    final manager = $$AgenceTransportTableTableManager(
      $_db,
      $_db.agenceTransport,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_agenceTransportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LigneTable, List<LigneData>> _ligneRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ligne,
    aliasName: $_aliasNameGenerator(db.reseau.id, db.ligne.reseauId),
  );

  $$LigneTableProcessedTableManager get ligneRefs {
    final manager = $$LigneTableTableManager(
      $_db,
      $_db.ligne,
    ).filter((f) => f.reseauId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_ligneRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReseauTableFilterComposer
    extends Composer<_$AppDatabase, $ReseauTable> {
  $$ReseauTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textColor => $composableBuilder(
    column: $table.textColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageFileName => $composableBuilder(
    column: $table.imageFileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$AgenceTransportTableFilterComposer get agenceTransportId {
    final $$AgenceTransportTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agenceTransportId,
      referencedTable: $db.agenceTransport,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenceTransportTableFilterComposer(
            $db: $db,
            $table: $db.agenceTransport,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ligneRefs(
    Expression<bool> Function($$LigneTableFilterComposer f) f,
  ) {
    final $$LigneTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.reseauId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableFilterComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReseauTableOrderingComposer
    extends Composer<_$AppDatabase, $ReseauTable> {
  $$ReseauTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textColor => $composableBuilder(
    column: $table.textColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageFileName => $composableBuilder(
    column: $table.imageFileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$AgenceTransportTableOrderingComposer get agenceTransportId {
    final $$AgenceTransportTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agenceTransportId,
      referencedTable: $db.agenceTransport,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenceTransportTableOrderingComposer(
            $db: $db,
            $table: $db.agenceTransport,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReseauTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReseauTable> {
  $$ReseauTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<String> get textColor =>
      $composableBuilder(column: $table.textColor, builder: (column) => column);

  GeneratedColumn<String> get imageFileName => $composableBuilder(
    column: $table.imageFileName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$AgenceTransportTableAnnotationComposer get agenceTransportId {
    final $$AgenceTransportTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agenceTransportId,
      referencedTable: $db.agenceTransport,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenceTransportTableAnnotationComposer(
            $db: $db,
            $table: $db.agenceTransport,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ligneRefs<T extends Object>(
    Expression<T> Function($$LigneTableAnnotationComposer a) f,
  ) {
    final $$LigneTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.reseauId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableAnnotationComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReseauTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReseauTable,
          ReseauData,
          $$ReseauTableFilterComposer,
          $$ReseauTableOrderingComposer,
          $$ReseauTableAnnotationComposer,
          $$ReseauTableCreateCompanionBuilder,
          $$ReseauTableUpdateCompanionBuilder,
          (ReseauData, $$ReseauTableReferences),
          ReseauData,
          PrefetchHooks Function({bool agenceTransportId, bool ligneRefs})
        > {
  $$ReseauTableTableManager(_$AppDatabase db, $ReseauTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReseauTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReseauTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReseauTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> agenceTransportId = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<String?> textColor = const Value.absent(),
                Value<String?> imageFileName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReseauCompanion(
                id: id,
                agenceTransportId: agenceTransportId,
                mode: mode,
                textColor: textColor,
                imageFileName: imageFileName,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int agenceTransportId,
                required String mode,
                Value<String?> textColor = const Value.absent(),
                Value<String?> imageFileName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReseauCompanion.insert(
                id: id,
                agenceTransportId: agenceTransportId,
                mode: mode,
                textColor: textColor,
                imageFileName: imageFileName,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ReseauTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({agenceTransportId = false, ligneRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (ligneRefs) db.ligne],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (agenceTransportId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.agenceTransportId,
                                    referencedTable: $$ReseauTableReferences
                                        ._agenceTransportIdTable(db),
                                    referencedColumn: $$ReseauTableReferences
                                        ._agenceTransportIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (ligneRefs)
                        await $_getPrefetchedData<
                          ReseauData,
                          $ReseauTable,
                          LigneData
                        >(
                          currentTable: table,
                          referencedTable: $$ReseauTableReferences
                              ._ligneRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReseauTableReferences(db, table, p0).ligneRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reseauId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ReseauTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReseauTable,
      ReseauData,
      $$ReseauTableFilterComposer,
      $$ReseauTableOrderingComposer,
      $$ReseauTableAnnotationComposer,
      $$ReseauTableCreateCompanionBuilder,
      $$ReseauTableUpdateCompanionBuilder,
      (ReseauData, $$ReseauTableReferences),
      ReseauData,
      PrefetchHooks Function({bool agenceTransportId, bool ligneRefs})
    >;
typedef $$LigneTableCreateCompanionBuilder =
    LigneCompanion Function({
      required String id,
      required String reseauId,
      required String gtfsId,
      Value<String?> shortName,
      Value<String?> longName,
      Value<String?> color,
      Value<int> rowid,
    });
typedef $$LigneTableUpdateCompanionBuilder =
    LigneCompanion Function({
      Value<String> id,
      Value<String> reseauId,
      Value<String> gtfsId,
      Value<String?> shortName,
      Value<String?> longName,
      Value<String?> color,
      Value<int> rowid,
    });

final class $$LigneTableReferences
    extends BaseReferences<_$AppDatabase, $LigneTable, LigneData> {
  $$LigneTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ReseauTable _reseauIdTable(_$AppDatabase db) => db.reseau.createAlias(
    $_aliasNameGenerator(db.ligne.reseauId, db.reseau.id),
  );

  $$ReseauTableProcessedTableManager get reseauId {
    final $_column = $_itemColumn<String>('reseau_id')!;

    final manager = $$ReseauTableTableManager(
      $_db,
      $_db.reseau,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reseauIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LignePolyTable, List<LignePolyData>>
  _lignePolyRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lignePoly,
    aliasName: $_aliasNameGenerator(db.ligne.id, db.lignePoly.ligneId),
  );

  $$LignePolyTableProcessedTableManager get lignePolyRefs {
    final manager = $$LignePolyTableTableManager(
      $_db,
      $_db.lignePoly,
    ).filter((f) => f.ligneId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_lignePolyRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PoteauLigneTable, List<PoteauLigneData>>
  _poteauLigneRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.poteauLigne,
    aliasName: $_aliasNameGenerator(db.ligne.id, db.poteauLigne.ligneId),
  );

  $$PoteauLigneTableProcessedTableManager get poteauLigneRefs {
    final manager = $$PoteauLigneTableTableManager(
      $_db,
      $_db.poteauLigne,
    ).filter((f) => f.ligneId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_poteauLigneRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LigneTableFilterComposer extends Composer<_$AppDatabase, $LigneTable> {
  $$LigneTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gtfsId => $composableBuilder(
    column: $table.gtfsId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get longName => $composableBuilder(
    column: $table.longName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  $$ReseauTableFilterComposer get reseauId {
    final $$ReseauTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reseauId,
      referencedTable: $db.reseau,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReseauTableFilterComposer(
            $db: $db,
            $table: $db.reseau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> lignePolyRefs(
    Expression<bool> Function($$LignePolyTableFilterComposer f) f,
  ) {
    final $$LignePolyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lignePoly,
      getReferencedColumn: (t) => t.ligneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LignePolyTableFilterComposer(
            $db: $db,
            $table: $db.lignePoly,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> poteauLigneRefs(
    Expression<bool> Function($$PoteauLigneTableFilterComposer f) f,
  ) {
    final $$PoteauLigneTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.poteauLigne,
      getReferencedColumn: (t) => t.ligneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauLigneTableFilterComposer(
            $db: $db,
            $table: $db.poteauLigne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LigneTableOrderingComposer
    extends Composer<_$AppDatabase, $LigneTable> {
  $$LigneTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gtfsId => $composableBuilder(
    column: $table.gtfsId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get longName => $composableBuilder(
    column: $table.longName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReseauTableOrderingComposer get reseauId {
    final $$ReseauTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reseauId,
      referencedTable: $db.reseau,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReseauTableOrderingComposer(
            $db: $db,
            $table: $db.reseau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LigneTableAnnotationComposer
    extends Composer<_$AppDatabase, $LigneTable> {
  $$LigneTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get gtfsId =>
      $composableBuilder(column: $table.gtfsId, builder: (column) => column);

  GeneratedColumn<String> get shortName =>
      $composableBuilder(column: $table.shortName, builder: (column) => column);

  GeneratedColumn<String> get longName =>
      $composableBuilder(column: $table.longName, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  $$ReseauTableAnnotationComposer get reseauId {
    final $$ReseauTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reseauId,
      referencedTable: $db.reseau,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReseauTableAnnotationComposer(
            $db: $db,
            $table: $db.reseau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> lignePolyRefs<T extends Object>(
    Expression<T> Function($$LignePolyTableAnnotationComposer a) f,
  ) {
    final $$LignePolyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lignePoly,
      getReferencedColumn: (t) => t.ligneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LignePolyTableAnnotationComposer(
            $db: $db,
            $table: $db.lignePoly,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> poteauLigneRefs<T extends Object>(
    Expression<T> Function($$PoteauLigneTableAnnotationComposer a) f,
  ) {
    final $$PoteauLigneTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.poteauLigne,
      getReferencedColumn: (t) => t.ligneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauLigneTableAnnotationComposer(
            $db: $db,
            $table: $db.poteauLigne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LigneTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LigneTable,
          LigneData,
          $$LigneTableFilterComposer,
          $$LigneTableOrderingComposer,
          $$LigneTableAnnotationComposer,
          $$LigneTableCreateCompanionBuilder,
          $$LigneTableUpdateCompanionBuilder,
          (LigneData, $$LigneTableReferences),
          LigneData,
          PrefetchHooks Function({
            bool reseauId,
            bool lignePolyRefs,
            bool poteauLigneRefs,
          })
        > {
  $$LigneTableTableManager(_$AppDatabase db, $LigneTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LigneTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LigneTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LigneTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reseauId = const Value.absent(),
                Value<String> gtfsId = const Value.absent(),
                Value<String?> shortName = const Value.absent(),
                Value<String?> longName = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LigneCompanion(
                id: id,
                reseauId: reseauId,
                gtfsId: gtfsId,
                shortName: shortName,
                longName: longName,
                color: color,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reseauId,
                required String gtfsId,
                Value<String?> shortName = const Value.absent(),
                Value<String?> longName = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LigneCompanion.insert(
                id: id,
                reseauId: reseauId,
                gtfsId: gtfsId,
                shortName: shortName,
                longName: longName,
                color: color,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LigneTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                reseauId = false,
                lignePolyRefs = false,
                poteauLigneRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lignePolyRefs) db.lignePoly,
                    if (poteauLigneRefs) db.poteauLigne,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (reseauId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.reseauId,
                                    referencedTable: $$LigneTableReferences
                                        ._reseauIdTable(db),
                                    referencedColumn: $$LigneTableReferences
                                        ._reseauIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (lignePolyRefs)
                        await $_getPrefetchedData<
                          LigneData,
                          $LigneTable,
                          LignePolyData
                        >(
                          currentTable: table,
                          referencedTable: $$LigneTableReferences
                              ._lignePolyRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LigneTableReferences(
                                db,
                                table,
                                p0,
                              ).lignePolyRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ligneId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (poteauLigneRefs)
                        await $_getPrefetchedData<
                          LigneData,
                          $LigneTable,
                          PoteauLigneData
                        >(
                          currentTable: table,
                          referencedTable: $$LigneTableReferences
                              ._poteauLigneRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LigneTableReferences(
                                db,
                                table,
                                p0,
                              ).poteauLigneRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ligneId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LigneTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LigneTable,
      LigneData,
      $$LigneTableFilterComposer,
      $$LigneTableOrderingComposer,
      $$LigneTableAnnotationComposer,
      $$LigneTableCreateCompanionBuilder,
      $$LigneTableUpdateCompanionBuilder,
      (LigneData, $$LigneTableReferences),
      LigneData,
      PrefetchHooks Function({
        bool reseauId,
        bool lignePolyRefs,
        bool poteauLigneRefs,
      })
    >;
typedef $$LignePolyTableCreateCompanionBuilder =
    LignePolyCompanion Function({
      required String ligneId,
      required int num,
      required double lat,
      required double lon,
      Value<int> rowid,
    });
typedef $$LignePolyTableUpdateCompanionBuilder =
    LignePolyCompanion Function({
      Value<String> ligneId,
      Value<int> num,
      Value<double> lat,
      Value<double> lon,
      Value<int> rowid,
    });

final class $$LignePolyTableReferences
    extends BaseReferences<_$AppDatabase, $LignePolyTable, LignePolyData> {
  $$LignePolyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LigneTable _ligneIdTable(_$AppDatabase db) => db.ligne.createAlias(
    $_aliasNameGenerator(db.lignePoly.ligneId, db.ligne.id),
  );

  $$LigneTableProcessedTableManager get ligneId {
    final $_column = $_itemColumn<String>('ligne_id')!;

    final manager = $$LigneTableTableManager(
      $_db,
      $_db.ligne,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ligneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LignePolyTableFilterComposer
    extends Composer<_$AppDatabase, $LignePolyTable> {
  $$LignePolyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get num => $composableBuilder(
    column: $table.num,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  $$LigneTableFilterComposer get ligneId {
    final $$LigneTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ligneId,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableFilterComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LignePolyTableOrderingComposer
    extends Composer<_$AppDatabase, $LignePolyTable> {
  $$LignePolyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get num => $composableBuilder(
    column: $table.num,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  $$LigneTableOrderingComposer get ligneId {
    final $$LigneTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ligneId,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableOrderingComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LignePolyTableAnnotationComposer
    extends Composer<_$AppDatabase, $LignePolyTable> {
  $$LignePolyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get num =>
      $composableBuilder(column: $table.num, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  $$LigneTableAnnotationComposer get ligneId {
    final $$LigneTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ligneId,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableAnnotationComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LignePolyTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LignePolyTable,
          LignePolyData,
          $$LignePolyTableFilterComposer,
          $$LignePolyTableOrderingComposer,
          $$LignePolyTableAnnotationComposer,
          $$LignePolyTableCreateCompanionBuilder,
          $$LignePolyTableUpdateCompanionBuilder,
          (LignePolyData, $$LignePolyTableReferences),
          LignePolyData,
          PrefetchHooks Function({bool ligneId})
        > {
  $$LignePolyTableTableManager(_$AppDatabase db, $LignePolyTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LignePolyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LignePolyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LignePolyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> ligneId = const Value.absent(),
                Value<int> num = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LignePolyCompanion(
                ligneId: ligneId,
                num: num,
                lat: lat,
                lon: lon,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String ligneId,
                required int num,
                required double lat,
                required double lon,
                Value<int> rowid = const Value.absent(),
              }) => LignePolyCompanion.insert(
                ligneId: ligneId,
                num: num,
                lat: lat,
                lon: lon,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LignePolyTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ligneId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ligneId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ligneId,
                                referencedTable: $$LignePolyTableReferences
                                    ._ligneIdTable(db),
                                referencedColumn: $$LignePolyTableReferences
                                    ._ligneIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LignePolyTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LignePolyTable,
      LignePolyData,
      $$LignePolyTableFilterComposer,
      $$LignePolyTableOrderingComposer,
      $$LignePolyTableAnnotationComposer,
      $$LignePolyTableCreateCompanionBuilder,
      $$LignePolyTableUpdateCompanionBuilder,
      (LignePolyData, $$LignePolyTableReferences),
      LignePolyData,
      PrefetchHooks Function({bool ligneId})
    >;
typedef $$ArretTableCreateCompanionBuilder =
    ArretCompanion Function({
      required String id,
      required int num,
      required String code,
      Value<String?> city,
      required String name,
      required bool visible,
      required double lat,
      required double lon,
      Value<int> rowid,
    });
typedef $$ArretTableUpdateCompanionBuilder =
    ArretCompanion Function({
      Value<String> id,
      Value<int> num,
      Value<String> code,
      Value<String?> city,
      Value<String> name,
      Value<bool> visible,
      Value<double> lat,
      Value<double> lon,
      Value<int> rowid,
    });

final class $$ArretTableReferences
    extends BaseReferences<_$AppDatabase, $ArretTable, ArretData> {
  $$ArretTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PoteauTable, List<PoteauData>> _poteauRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.poteau,
    aliasName: $_aliasNameGenerator(db.arret.id, db.poteau.arretId),
  );

  $$PoteauTableProcessedTableManager get poteauRefs {
    final manager = $$PoteauTableTableManager(
      $_db,
      $_db.poteau,
    ).filter((f) => f.arretId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_poteauRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ArretTableFilterComposer extends Composer<_$AppDatabase, $ArretTable> {
  $$ArretTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get num => $composableBuilder(
    column: $table.num,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> poteauRefs(
    Expression<bool> Function($$PoteauTableFilterComposer f) f,
  ) {
    final $$PoteauTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.poteau,
      getReferencedColumn: (t) => t.arretId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauTableFilterComposer(
            $db: $db,
            $table: $db.poteau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ArretTableOrderingComposer
    extends Composer<_$AppDatabase, $ArretTable> {
  $$ArretTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get num => $composableBuilder(
    column: $table.num,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ArretTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArretTable> {
  $$ArretTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get num =>
      $composableBuilder(column: $table.num, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get visible =>
      $composableBuilder(column: $table.visible, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  Expression<T> poteauRefs<T extends Object>(
    Expression<T> Function($$PoteauTableAnnotationComposer a) f,
  ) {
    final $$PoteauTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.poteau,
      getReferencedColumn: (t) => t.arretId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauTableAnnotationComposer(
            $db: $db,
            $table: $db.poteau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ArretTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArretTable,
          ArretData,
          $$ArretTableFilterComposer,
          $$ArretTableOrderingComposer,
          $$ArretTableAnnotationComposer,
          $$ArretTableCreateCompanionBuilder,
          $$ArretTableUpdateCompanionBuilder,
          (ArretData, $$ArretTableReferences),
          ArretData,
          PrefetchHooks Function({bool poteauRefs})
        > {
  $$ArretTableTableManager(_$AppDatabase db, $ArretTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArretTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArretTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArretTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> num = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> visible = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArretCompanion(
                id: id,
                num: num,
                code: code,
                city: city,
                name: name,
                visible: visible,
                lat: lat,
                lon: lon,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int num,
                required String code,
                Value<String?> city = const Value.absent(),
                required String name,
                required bool visible,
                required double lat,
                required double lon,
                Value<int> rowid = const Value.absent(),
              }) => ArretCompanion.insert(
                id: id,
                num: num,
                code: code,
                city: city,
                name: name,
                visible: visible,
                lat: lat,
                lon: lon,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ArretTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({poteauRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (poteauRefs) db.poteau],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (poteauRefs)
                    await $_getPrefetchedData<
                      ArretData,
                      $ArretTable,
                      PoteauData
                    >(
                      currentTable: table,
                      referencedTable: $$ArretTableReferences._poteauRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$ArretTableReferences(db, table, p0).poteauRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.arretId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ArretTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArretTable,
      ArretData,
      $$ArretTableFilterComposer,
      $$ArretTableOrderingComposer,
      $$ArretTableAnnotationComposer,
      $$ArretTableCreateCompanionBuilder,
      $$ArretTableUpdateCompanionBuilder,
      (ArretData, $$ArretTableReferences),
      ArretData,
      PrefetchHooks Function({bool poteauRefs})
    >;
typedef $$PoteauTableCreateCompanionBuilder =
    PoteauCompanion Function({
      required String id,
      required String code,
      required bool visible,
      required String arretId,
      required double lat,
      required double lon,
      Value<int> rowid,
    });
typedef $$PoteauTableUpdateCompanionBuilder =
    PoteauCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<bool> visible,
      Value<String> arretId,
      Value<double> lat,
      Value<double> lon,
      Value<int> rowid,
    });

final class $$PoteauTableReferences
    extends BaseReferences<_$AppDatabase, $PoteauTable, PoteauData> {
  $$PoteauTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArretTable _arretIdTable(_$AppDatabase db) => db.arret.createAlias(
    $_aliasNameGenerator(db.poteau.arretId, db.arret.id),
  );

  $$ArretTableProcessedTableManager get arretId {
    final $_column = $_itemColumn<String>('arret_id')!;

    final manager = $$ArretTableTableManager(
      $_db,
      $_db.arret,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_arretIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PoteauLigneTable, List<PoteauLigneData>>
  _poteauLigneRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.poteauLigne,
    aliasName: $_aliasNameGenerator(db.poteau.id, db.poteauLigne.poteauId),
  );

  $$PoteauLigneTableProcessedTableManager get poteauLigneRefs {
    final manager = $$PoteauLigneTableTableManager(
      $_db,
      $_db.poteauLigne,
    ).filter((f) => f.poteauId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_poteauLigneRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PoteauTableFilterComposer
    extends Composer<_$AppDatabase, $PoteauTable> {
  $$PoteauTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  $$ArretTableFilterComposer get arretId {
    final $$ArretTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.arretId,
      referencedTable: $db.arret,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArretTableFilterComposer(
            $db: $db,
            $table: $db.arret,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> poteauLigneRefs(
    Expression<bool> Function($$PoteauLigneTableFilterComposer f) f,
  ) {
    final $$PoteauLigneTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.poteauLigne,
      getReferencedColumn: (t) => t.poteauId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauLigneTableFilterComposer(
            $db: $db,
            $table: $db.poteauLigne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PoteauTableOrderingComposer
    extends Composer<_$AppDatabase, $PoteauTable> {
  $$PoteauTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  $$ArretTableOrderingComposer get arretId {
    final $$ArretTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.arretId,
      referencedTable: $db.arret,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArretTableOrderingComposer(
            $db: $db,
            $table: $db.arret,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PoteauTableAnnotationComposer
    extends Composer<_$AppDatabase, $PoteauTable> {
  $$PoteauTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<bool> get visible =>
      $composableBuilder(column: $table.visible, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  $$ArretTableAnnotationComposer get arretId {
    final $$ArretTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.arretId,
      referencedTable: $db.arret,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArretTableAnnotationComposer(
            $db: $db,
            $table: $db.arret,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> poteauLigneRefs<T extends Object>(
    Expression<T> Function($$PoteauLigneTableAnnotationComposer a) f,
  ) {
    final $$PoteauLigneTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.poteauLigne,
      getReferencedColumn: (t) => t.poteauId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauLigneTableAnnotationComposer(
            $db: $db,
            $table: $db.poteauLigne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PoteauTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PoteauTable,
          PoteauData,
          $$PoteauTableFilterComposer,
          $$PoteauTableOrderingComposer,
          $$PoteauTableAnnotationComposer,
          $$PoteauTableCreateCompanionBuilder,
          $$PoteauTableUpdateCompanionBuilder,
          (PoteauData, $$PoteauTableReferences),
          PoteauData,
          PrefetchHooks Function({bool arretId, bool poteauLigneRefs})
        > {
  $$PoteauTableTableManager(_$AppDatabase db, $PoteauTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PoteauTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PoteauTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PoteauTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<bool> visible = const Value.absent(),
                Value<String> arretId = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PoteauCompanion(
                id: id,
                code: code,
                visible: visible,
                arretId: arretId,
                lat: lat,
                lon: lon,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required bool visible,
                required String arretId,
                required double lat,
                required double lon,
                Value<int> rowid = const Value.absent(),
              }) => PoteauCompanion.insert(
                id: id,
                code: code,
                visible: visible,
                arretId: arretId,
                lat: lat,
                lon: lon,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PoteauTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({arretId = false, poteauLigneRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (poteauLigneRefs) db.poteauLigne],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (arretId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.arretId,
                                referencedTable: $$PoteauTableReferences
                                    ._arretIdTable(db),
                                referencedColumn: $$PoteauTableReferences
                                    ._arretIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (poteauLigneRefs)
                    await $_getPrefetchedData<
                      PoteauData,
                      $PoteauTable,
                      PoteauLigneData
                    >(
                      currentTable: table,
                      referencedTable: $$PoteauTableReferences
                          ._poteauLigneRefsTable(db),
                      managerFromTypedResult: (p0) => $$PoteauTableReferences(
                        db,
                        table,
                        p0,
                      ).poteauLigneRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.poteauId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PoteauTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PoteauTable,
      PoteauData,
      $$PoteauTableFilterComposer,
      $$PoteauTableOrderingComposer,
      $$PoteauTableAnnotationComposer,
      $$PoteauTableCreateCompanionBuilder,
      $$PoteauTableUpdateCompanionBuilder,
      (PoteauData, $$PoteauTableReferences),
      PoteauData,
      PrefetchHooks Function({bool arretId, bool poteauLigneRefs})
    >;
typedef $$PoteauLigneTableCreateCompanionBuilder =
    PoteauLigneCompanion Function({
      required String poteauId,
      required String ligneId,
      Value<int> rowid,
    });
typedef $$PoteauLigneTableUpdateCompanionBuilder =
    PoteauLigneCompanion Function({
      Value<String> poteauId,
      Value<String> ligneId,
      Value<int> rowid,
    });

final class $$PoteauLigneTableReferences
    extends BaseReferences<_$AppDatabase, $PoteauLigneTable, PoteauLigneData> {
  $$PoteauLigneTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PoteauTable _poteauIdTable(_$AppDatabase db) => db.poteau.createAlias(
    $_aliasNameGenerator(db.poteauLigne.poteauId, db.poteau.id),
  );

  $$PoteauTableProcessedTableManager get poteauId {
    final $_column = $_itemColumn<String>('poteau_id')!;

    final manager = $$PoteauTableTableManager(
      $_db,
      $_db.poteau,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poteauIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LigneTable _ligneIdTable(_$AppDatabase db) => db.ligne.createAlias(
    $_aliasNameGenerator(db.poteauLigne.ligneId, db.ligne.id),
  );

  $$LigneTableProcessedTableManager get ligneId {
    final $_column = $_itemColumn<String>('ligne_id')!;

    final manager = $$LigneTableTableManager(
      $_db,
      $_db.ligne,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ligneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PoteauLigneTableFilterComposer
    extends Composer<_$AppDatabase, $PoteauLigneTable> {
  $$PoteauLigneTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PoteauTableFilterComposer get poteauId {
    final $$PoteauTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poteauId,
      referencedTable: $db.poteau,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauTableFilterComposer(
            $db: $db,
            $table: $db.poteau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LigneTableFilterComposer get ligneId {
    final $$LigneTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ligneId,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableFilterComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PoteauLigneTableOrderingComposer
    extends Composer<_$AppDatabase, $PoteauLigneTable> {
  $$PoteauLigneTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PoteauTableOrderingComposer get poteauId {
    final $$PoteauTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poteauId,
      referencedTable: $db.poteau,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauTableOrderingComposer(
            $db: $db,
            $table: $db.poteau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LigneTableOrderingComposer get ligneId {
    final $$LigneTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ligneId,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableOrderingComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PoteauLigneTableAnnotationComposer
    extends Composer<_$AppDatabase, $PoteauLigneTable> {
  $$PoteauLigneTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PoteauTableAnnotationComposer get poteauId {
    final $$PoteauTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poteauId,
      referencedTable: $db.poteau,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoteauTableAnnotationComposer(
            $db: $db,
            $table: $db.poteau,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LigneTableAnnotationComposer get ligneId {
    final $$LigneTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ligneId,
      referencedTable: $db.ligne,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LigneTableAnnotationComposer(
            $db: $db,
            $table: $db.ligne,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PoteauLigneTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PoteauLigneTable,
          PoteauLigneData,
          $$PoteauLigneTableFilterComposer,
          $$PoteauLigneTableOrderingComposer,
          $$PoteauLigneTableAnnotationComposer,
          $$PoteauLigneTableCreateCompanionBuilder,
          $$PoteauLigneTableUpdateCompanionBuilder,
          (PoteauLigneData, $$PoteauLigneTableReferences),
          PoteauLigneData,
          PrefetchHooks Function({bool poteauId, bool ligneId})
        > {
  $$PoteauLigneTableTableManager(_$AppDatabase db, $PoteauLigneTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PoteauLigneTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PoteauLigneTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PoteauLigneTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> poteauId = const Value.absent(),
                Value<String> ligneId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PoteauLigneCompanion(
                poteauId: poteauId,
                ligneId: ligneId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String poteauId,
                required String ligneId,
                Value<int> rowid = const Value.absent(),
              }) => PoteauLigneCompanion.insert(
                poteauId: poteauId,
                ligneId: ligneId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PoteauLigneTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({poteauId = false, ligneId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (poteauId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.poteauId,
                                referencedTable: $$PoteauLigneTableReferences
                                    ._poteauIdTable(db),
                                referencedColumn: $$PoteauLigneTableReferences
                                    ._poteauIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (ligneId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ligneId,
                                referencedTable: $$PoteauLigneTableReferences
                                    ._ligneIdTable(db),
                                referencedColumn: $$PoteauLigneTableReferences
                                    ._ligneIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PoteauLigneTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PoteauLigneTable,
      PoteauLigneData,
      $$PoteauLigneTableFilterComposer,
      $$PoteauLigneTableOrderingComposer,
      $$PoteauLigneTableAnnotationComposer,
      $$PoteauLigneTableCreateCompanionBuilder,
      $$PoteauLigneTableUpdateCompanionBuilder,
      (PoteauLigneData, $$PoteauLigneTableReferences),
      PoteauLigneData,
      PrefetchHooks Function({bool poteauId, bool ligneId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AgenceTransportTableTableManager get agenceTransport =>
      $$AgenceTransportTableTableManager(_db, _db.agenceTransport);
  $$ReseauTableTableManager get reseau =>
      $$ReseauTableTableManager(_db, _db.reseau);
  $$LigneTableTableManager get ligne =>
      $$LigneTableTableManager(_db, _db.ligne);
  $$LignePolyTableTableManager get lignePoly =>
      $$LignePolyTableTableManager(_db, _db.lignePoly);
  $$ArretTableTableManager get arret =>
      $$ArretTableTableManager(_db, _db.arret);
  $$PoteauTableTableManager get poteau =>
      $$PoteauTableTableManager(_db, _db.poteau);
  $$PoteauLigneTableTableManager get poteauLigne =>
      $$PoteauLigneTableTableManager(_db, _db.poteauLigne);
}
