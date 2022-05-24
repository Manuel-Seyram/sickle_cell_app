import 'package:moor_flutter/moor_flutter.dart';
part 'database.g.dart';

class ToDoTable extends Table {
  bool dontWarnAboutMultipleDatabases = true;
  // autoincrement sets this to the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 5, max: 50)();
  TextColumn get image => text()();
  TextColumn get extra => text()();
}

@UseMoor(tables: [ToDoTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List> getAllToDo() =>
      select(toDoTable).get();
  Future insertTodo(ToDoTableData todo) =>
      into(toDoTable).insert(todo);
  Future updateTodo(ToDoTableData todo) =>
      update(toDoTable).replace(todo);
  Future deleteTodo(ToDoTableData todo) =>
      delete(toDoTable).delete(todo);
}