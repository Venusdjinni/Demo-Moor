import 'package:moor_flutter/moor_flutter.dart';

part 'persistence.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  BoolColumn get checked => boolean()();
}

@UseMoor(tables: [Todos])
class Database extends _$Database {
  Database() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  static Database _instance;
  static Database get() => _instance ?? (_instance = new Database());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  Stream<List<Todo>> get allTodos {
    return select(todos).watch();
  }

  void insert(Todo todo) {
    into(todos).insert(todo, orReplace: true);
  }
}