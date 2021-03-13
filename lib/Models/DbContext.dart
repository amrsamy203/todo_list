
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  static DbHelper _dbHelper;
  static Database _database;

  String todoTable = 'todo_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription= 'description';
  String colCategory = 'category';
  String colDate = 'date';

  DbHelper._createInstance();

  factory DbHelper() {

    if(_dbHelper == null) {
      _dbHelper = DbHelper._createInstance();
    }
    return _dbHelper;
  }

  Future<Database> get database async {

    if(_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todo.db';

    // Open/create the database at a given path
    var todoDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb (Database _db, int numVersion) async {
    await _db.execute('CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colDate TEXT)');
  }


}