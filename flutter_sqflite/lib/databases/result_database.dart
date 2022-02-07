import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:state_base/models/result.dart';

class ResultDatabase{
  final String DB_NAME = "result.db";
  final String TABLE = "result";
  final String ID = "id";
  final String AVERAGE_MARK = "average_mark";
  final String ADJUSTMENT = "adjustment";


  static final ResultDatabase _instance = ResultDatabase._();
  ResultDatabase._();

  factory ResultDatabase() {
    return _instance;
  }

  static Database? _database ;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }
/*
  // Có database sẵn
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/databases", DB_NAME));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    // open the database
    var db = await openDatabase(path, readOnly: true);
    return db;
  }

 */

  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    var database = openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $TABLE(
        $ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $AVERAGE_MARK REAL,
        $ADJUSTMENT TEXT)
    ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }


  // CRUD : Create, Read, Update , Delete -  Search

  Future<int> addResult(Result? result) async {
    var client = await db;
    return client!.insert(TABLE, result!.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Result?> fetchResult(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$ID = ?', whereArgs: [id]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return Result.fromJson(maps.first);
    }
    return null;
  }




  Future<List<Result>> fetchAll() async {
    var client = await db;
    var res = await client!.query(TABLE);

    if (res.isNotEmpty) {
      var results = res.map((resultMap) => Result.fromJson(resultMap)).toList();
      return results;
    }
    return [];
  }

  Future<int> updateWord(Result result) async {
    var client = await db;
    return client!.update(TABLE, result.toJson(),
        where: '$ID = ?', whereArgs: [result.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future closeDb() async {
    var client = await db;
    client!.close();
  }


}