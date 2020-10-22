import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await dbInit();
    return _db;
  }

  dbInit() async {
    var dbFolder = await getDatabasesPath();
    String path = dbFolder + "catchgoal.db";

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE subject (
                        id VARCHAR(36) PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        unit VARCHAR(10) NOT NULL,
                        createdate VARCHAR(20) NOT NULL,
                        type VARCHAR(50) NOT NULL
                      );''');
  }
}
