import 'package:sqflite/sqflite.dart';
import 'package:todo_app_flutter/core/models/task.dart';

class DBHelper {
  static Database? _database;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (null != _database) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _database = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE $_tableName('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'title STRING, note TEXT, date STRING, startTime STRING, endTime STRING, '
            'remind INTEGER, repeat STRING, color INTEGER, isCompleted INTEGER)',
          );
        },
      );
    } catch (exception) {
      print(exception.toString());
    }
  }

  Future<List<Map<String, Object?>>> getAllTasks() async {
    print('getting all tasks');
    return await _database!.query(_tableName);
  }

  Future<void> delete(int id) async {
    await _database!.delete(_tableName, where: 'id=?', whereArgs: [id]);
  }

  Future<void> update(int id) async {
    await _database!.rawUpdate(
      '''
      UPDATE tasks 
      SET isCompleted = ? 
      WHERE id = ?
      ''',
      [1, id],
    );
  }

  Future<int> insert(Task task) async {
    print('inserting task to database');
    try {
      return await _database!.insert(
        _tableName,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (exception) {
      rethrow;
    }
  }
}
