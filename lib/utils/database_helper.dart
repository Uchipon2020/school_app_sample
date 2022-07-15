/*import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/data_school.dart';

class Dog {
  String schoolTable = 'school_table';
  String colId = "id";
  String colPriority = 'priority';
  String colHeight = 'height';
  String colWeight = 'weight';

  final int id;
  final int priority;
  final int height;
  final int weight;

  const Dog({
   required this.id,
    required this.priority,
    required this.height,
    required this.weight,
});


  factory DatabaseHelper(){

    if (_databaseHelper ==null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
      return _databaseHelper;
    }

    Future<Database> get database async{
      if (_database == null){
        _database = await initializeDatabase();}
        return _database;
      }

    Future<Database> initializeDatabase() async {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path + 'school.db';

      var schoolDatabase = await openDatabase(path,version:1, onCreate: _createDb);
      return schoolDatabase;
    }
    void _createdDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $schoolTable('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' $colHeight TEXT,'
        ' $colWeight TEXT,'
        ' $colPriority INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getSchoolMapList() async{
    Database db = await this.database;

    var result = await db.query(schoolTable, dataSchool.toMap());
    return result;
  }

  Future<int> updateDataShool(DataSchool dataShool) async{
    var db = await this.database;
    var result = await db.update(schoolTable, dataShool.toMap(), where: '$colId = ?', shereArges: [data.school.id]);
    return result;
  }
  Future<int> insertDataShool(DataSchool dataSchool) async{
    var db = await this.database;
    var result = await db.insert(schoolTable, dataSchool.toMap());
    return result;
  }*/

