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
