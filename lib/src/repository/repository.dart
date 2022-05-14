import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  static const _databaseName = "hoursControls.db";
  static const _databaseVersion = 1;
  static const _tableEmployee = 'CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY, name TEXT, team TEXT, allocation TEXT,status TEXT, technology TEXT)';
  static const _tableHoliday = 'CREATE TABLE IF NOT EXISTS holiday (id INTEGER PRIMARY KEY, name TEXT, day TEXT NOT NULL,status TEXT)';
  static const _tableWorkDay = 'CREATE TABLE IF NOT EXISTS work_day (id INTEGER PRIMARY KEY, employee_id INTEGER, date TEXT, hour REAL,status TEXT)';

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
        return _database;
    }
    _database = await _initDatabase();
    return _database;
  } 

   // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,_databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }
  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute(_tableEmployee);
    await db.execute(_tableHoliday);
    await db.execute(_tableWorkDay);
  }
 
}