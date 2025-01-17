import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/favoriteModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'never.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE $tableName (
        ${Favorites.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Favorites.title} TEXT,
        ${Favorites.isFavorite} INTEGER
      )
    ''');
      },
    );
  }
}
