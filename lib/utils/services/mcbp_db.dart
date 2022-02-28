import 'dart:async';

import 'package:mcbp/modules/dashboards/models/login.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class McbpDatabase{
  static final McbpDatabase instance = McbpDatabase._init();

  static Database? _database;

  McbpDatabase._init();

  Future<Database> get database async{
    if(_database != null) return _database!;

    _database = await _initDB('MCBP.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);

    return await openDatabase(path, version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREAMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    await db.execute(
      '''
        CREATE TABLE $tableLogin(
          ${LoginFields.id} $idType,
          PRIMARY KEY ${LoginFields.username} $textType,
          ${LoginFields.password} $textType
        )
      '''
    );
  }

  Future<Login> create(Login login) async{
    final db = await instance.database;
    
    final id = await db.insert(tableLogin, login.toJson());

    return login.copy(id:id);
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }
}