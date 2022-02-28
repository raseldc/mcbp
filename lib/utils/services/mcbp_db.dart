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
    final idType = 'INTEGER PRIMARY KEY';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    await db.execute(
      '''
        CREATE TABLE $tableLogin(
          ${LoginFields.id} $idType,
          ${LoginFields.username} TEXT NOT NULL UNIQUE,
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

  Future<Login?> loginAuth(String userId, String pass) async{
    final db = await instance.database;
    var query = "SELECT * FROM $tableLogin WHERE"
        " ${LoginFields.username} = '$userId' AND"
        " ${LoginFields.password} = '$pass'";
    var res = await db.rawQuery(query);

    if(res.isNotEmpty){
      return Login.fromMap(res.first);
    }

    return null;
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }
}