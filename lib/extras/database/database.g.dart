// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ToDoTableData extends DataClass implements Insertable<ToDoTableData> {
  final int? id;
  final String name;
  final String image;
  final String extra;
  ToDoTableData(
      {this.id, required this.name, required this.image, required this.extra});
  factory ToDoTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';

    return ToDoTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      extra: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}extra'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id!);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['extra'] = Variable<String>(extra);
    return map;
  }

  ToDoTableCompanion toCompanion(bool nullToAbsent) {
    return ToDoTableCompanion(
      id: Value(id!),
      name: Value(name),
      image: Value(image),
      extra: Value(extra),
    );
  }

  factory ToDoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ToDoTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      extra: serializer.fromJson<String>(json['extra']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'extra': serializer.toJson<String>(extra),
    };
  }

  ToDoTableData copyWith(
          {int? id, String? name, String? image, String? extra}) =>
      ToDoTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        extra: extra ?? this.extra,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('extra: $extra')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, extra);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDoTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.extra == this.extra);
}

class ToDoTableCompanion extends UpdateCompanion<ToDoTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<String> extra;
  const ToDoTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.extra = const Value.absent(),
  });
  ToDoTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    required String extra,
  })  : name = Value(name),
        image = Value(image),
        extra = Value(extra);
  static Insertable<ToDoTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? extra,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (extra != null) 'extra': extra,
    });
  }

  ToDoTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? image,
      Value<String>? extra}) {
    return ToDoTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      extra: extra ?? this.extra,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (extra.present) {
      map['extra'] = Variable<String>(extra.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('extra: $extra')
          ..write(')'))
        .toString();
  }
}

class $ToDoTableTable extends ToDoTable
    with TableInfo<$ToDoTableTable, ToDoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToDoTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _extraMeta = const VerificationMeta('extra');
  @override
  late final GeneratedColumn<String?> extra = GeneratedColumn<String?>(
      'extra', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, image, extra];
  @override
  String get aliasedName => _alias ?? 'to_do_table';
  @override
  String get actualTableName => 'to_do_table';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('extra')) {
      context.handle(
          _extraMeta, extra.isAcceptableOrUnknown(data['extra']!, _extraMeta));
    } else if (isInserting) {
      context.missing(_extraMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ToDoTableData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ToDoTableTable createAlias(String alias) {
    return $ToDoTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ToDoTableTable toDoTable = $ToDoTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoTable];
}
