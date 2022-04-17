import 'dart:async';

import 'package:mcbp/domain/model/login.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/model/registration.dart';

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

    await db.execute(
      '''
        CREATE TABLE $tableRegistration(
          ${RegistrationFields.id} $idType,
          ${RegistrationFields.nationalId} $textType,
          ${RegistrationFields.birthDate} $textType,
          ${RegistrationFields.personalNameInBangla} $textType,
          ${RegistrationFields.personalNameInEnglish} $textType,
          ${RegistrationFields.personalFatherName} $textType,
          ${RegistrationFields.personalMotherName} $textType,
          ${RegistrationFields.personalHusbandName} $textType,
          ${RegistrationFields.personalNickName} $textType,
          ${RegistrationFields.personalBirthPlace} $textType,
          ${RegistrationFields.personalReligeon} $textType,
          ${RegistrationFields.personalMobileNo} $textType,
          ${RegistrationFields.personalEducation} $textType,
          ${RegistrationFields.personalBloodGroup} $textType,
          ${RegistrationFields.personalMaritialStatus} $textType,
          ${RegistrationFields.presentDivision} $textType,
          ${RegistrationFields.presentDistrict} $textType,
          ${RegistrationFields.presentSubDistrict} $textType,
          ${RegistrationFields.presentUnion} $textType,
          ${RegistrationFields.presentVillage} $textType,
          ${RegistrationFields.presentPostCode} $textType,
          ${RegistrationFields.presentStreet} $textType,
          ${RegistrationFields.permanentDivision} $textType,
          ${RegistrationFields.permanentDistrict} $textType,
          ${RegistrationFields.permanentSubDistrict} $textType,
          ${RegistrationFields.permanentUnion} $textType,
          ${RegistrationFields.permanentVillage} $textType,
          ${RegistrationFields.permanentPostCode} $textType,
          ${RegistrationFields.permanentStreet} $textType,
          ${RegistrationFields.propertyAmount} $textType,
          ${RegistrationFields.familyHeadOccupation} $textType,
          ${RegistrationFields.husbandMonthlyIncome} $textType,
          ${RegistrationFields.sanitationFacility} $textType,
          ${RegistrationFields.electricityFacility} $textType,
          ${RegistrationFields.electricityFan} $textType,
          ${RegistrationFields.tubewelFacility} $textType,
          ${RegistrationFields.bedRoomWall} $textType,
          ${RegistrationFields.disablePerson} $textType,
          ${RegistrationFields.conceptionPriod} $textType,
          ${RegistrationFields.conceptionTimeInWeek} $textType,
          ${RegistrationFields.paymentType} $textType,
          ${RegistrationFields.accountName} $textType,
          ${RegistrationFields.accountNumber} $textType,
          ${RegistrationFields.photo} $textType,
          ${RegistrationFields.signature} $textType,
          ${RegistrationFields.attachment} $textType
        )
      '''
    );

  }

  Future<Login> create(Login login) async{
    final db = await instance.database;
    
    final id = await db.insert(tableLogin, login.toJson());

    return login.copy(id:id);
  }

  Future<Map<String, Object?>> createRegistration(Registration registration) async{
    final db = await instance.database;
    
    final id = await db.insert(tableRegistration, registration.toJson());

    return registration.toJson();
  }

  Future<List<Registration>> registrationList() async {
    // Get a reference to the database.
    final db = await instance.database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query("registration");

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.from(maps).map<Registration>((registration) => Registration.fromMap(registration)).toList();
  }

  Future<List<Registration>> searchByNid(String nid) async {
    // Get a reference to the database.
    final db = await instance.database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query("registration", where: "nationalId = ", whereArgs: [nid]);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.from(maps).map<Registration>((registration) => Registration.fromMap(registration)).toList();
  }

  Future<Map<String, Object?>> updateRegistration(Registration registration) async {
  // Get a reference to the database.
    final db = await instance.database;

    // Update the given Dog.
    await db.update(
      'registration',
      registration.toJson(),
      // Ensure that the Dog has a matching id.
      where: '${RegistrationFields.nationalId} = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [registration.nationalId],
    );

    return registration.toJson();
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