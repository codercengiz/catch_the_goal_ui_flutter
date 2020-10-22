import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SubjectDatabaseProvider {
  String _subjectDatabaseName = "goaldb";
  String _subjectTableName = "subject";
  Database database;
  Future<void> open() async {
    database = await openDatabase(
      _subjectDatabaseName,
      onCreate: (db, version) {
        //db.query(table);
        db.execute('''CREATE TABLE $_subjectTableName (
                        id VARCHAR(36) PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        unit VARCHAR(10) NOT NULL,
                        createdate VARCHAR(20) NOT NULL,
                        type VARCHAR(50) NOT NULL
                      );''');
      },
    );
  }
}
