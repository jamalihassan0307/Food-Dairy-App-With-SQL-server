import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'package:flutter/material.dart';

class SQL {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'food_diary.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        username TEXT,
        email TEXT,
        password TEXT,
        phone TEXT,
        dob TEXT,
        image TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE recipes (
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        imageUrl TEXT,
        calories TEXT,
        protein TEXT,
        prepTime TEXT
      )
    ''');
  }

  static Future<void> post(String query) async {
    final db = await database;
    await db.rawInsert(query);
  }

  static Future<List<Map<String, dynamic>>> get(String query) async {
    final db = await database;
    return await db.rawQuery(query);
  }

  static Future<void> Update(String query) async {
    final db = await database;
    await db.rawUpdate(query);
  }
}
