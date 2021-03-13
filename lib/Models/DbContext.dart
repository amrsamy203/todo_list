
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/Models/NewTask.dart';


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
  // Get All todo objects
  Future<List<Map<String, dynamic>>> getAllTodo() async {
    Database _db = await this.database;
    var result = await _db.query(todoTable);
    return result;
  }
  // Insert A new (ToDo)Object to table
  Future<int> insertTodo(ToDo newTodo) async {
    // Get a reference to the database.
    final Database _db = await this.database;
    var result = await _db.insert(todoTable, newTodo.toMap());
    return result;
  }
  // Update a Specific ToDo
  Future<int> updateTodo(ToDo todo) async {
    final _db = await this.database;
    var result = await _db.update(todoTable, todo.toMap(), where: '$colId = ?', whereArgs: [todo.id]);
    return result;
  }
  // Delete a Specific ToDo
  Future<int> deleteToDo(int id) async {
    final _db = await this.database;
    int result = await _db.delete(todoTable, where: 'id = ?', whereArgs: [id]);
    return result;
  }
  // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  Future<List<ToDo>> getTodoList() async {
    var todoMapList = await getAllTodo(); // Get 'Map List' from database
    int count = todoMapList.length;         // Count the number of map entries in db table

    // ignore: deprecated_member_use
    List<ToDo> todoList = List<ToDo>();
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      todoList.add(ToDo.fromMapObject(todoMapList[i]));
    }

    return todoList;
  }
  // Get The number Of Objects in Table
  Future<int> getCount() async {
    final _db = await this.database;
    List<Map<String, dynamic>> cou = _db.rawQuery('SELECT COUNT(*) FROM $todoTable') as List<Map<String, dynamic>>;
    int result = Sqflite.firstIntValue(cou);
    return result;
  }
}