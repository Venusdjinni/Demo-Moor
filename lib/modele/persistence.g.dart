// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistence.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Todo extends DataClass {
  final int id;
  final String content;
  final bool checked;
  Todo({this.id, this.content, this.checked});
  factory Todo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Todo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      checked:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}checked']),
    );
  }
  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      checked: serializer.fromJson<bool>(json['checked']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'checked': serializer.toJson<bool>(checked),
    };
  }

  Todo copyWith({int id, String content, bool checked}) => Todo(
        id: id ?? this.id,
        content: content ?? this.content,
        checked: checked ?? this.checked,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc($mrjc($mrjc(0, id.hashCode), content.hashCode), checked.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == id &&
          other.content == content &&
          other.checked == checked);
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodosTable(this._db, [this._alias]);
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  GeneratedBoolColumn _checked;
  @override
  GeneratedBoolColumn get checked => _checked ??= _constructChecked();
  GeneratedBoolColumn _constructChecked() {
    return GeneratedBoolColumn(
      'checked',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, content, checked];
  @override
  $TodosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todos';
  @override
  final String actualTableName = 'todos';
  @override
  bool validateIntegrity(Todo instance, bool isInserting) =>
      id.isAcceptableValue(instance.id, isInserting) &&
      content.isAcceptableValue(instance.content, isInserting) &&
      checked.isAcceptableValue(instance.checked, isInserting);
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Todo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(Todo d, {bool includeNulls = false}) {
    final map = <String, Variable>{};
    if (d.id != null || includeNulls) {
      map['id'] = Variable<int, IntType>(d.id);
    }
    if (d.content != null || includeNulls) {
      map['content'] = Variable<String, StringType>(d.content);
    }
    if (d.checked != null || includeNulls) {
      map['checked'] = Variable<bool, BoolType>(d.checked);
    }
    return map;
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TodosTable _todos;
  $TodosTable get todos => _todos ??= $TodosTable(this);
  @override
  List<TableInfo> get allTables => [todos];
}
