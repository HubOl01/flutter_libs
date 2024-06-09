import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('recipes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
       CREATE TABLE recipes (
        ${RecipeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${RecipeFields.title} TEXT NOT NULL,
        ${RecipeFields.ingredients} TEXT NOT NULL,
        ${RecipeFields.proofingTime} INTEGER NOT NULL,
        ${RecipeFields.proofingTemp} TEXT NOT NULL,
        ${RecipeFields.bakingTime} INTEGER NOT NULL,
        ${RecipeFields.bakingTemp} TEXT NOT NULL
      )
    ''');
  }

  Future<int> create(RecipeModel recipe) async {
    final db = await instance.database;
    print("!!! Successed create id = ${recipe} !!!");
    return await db.insert('recipes', recipe.toMap());
  }

  Future<RecipeModel?> readRecipe(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'recipes',
      columns: RecipeFields.values,
      where: '${RecipeFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return RecipeModel.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<RecipeModel>> readAllRecipes() async {
    final db = await instance.database;

    final result = await db.query('recipes');
    print("Reading all recipes");
    return result.map((json) => RecipeModel.fromMap(json)).toList();
  }

  Future<int> update(RecipeModel recipe) async {
    final db = await instance.database;
    print("!!! Successed update id = ${recipe.id} !!!");
    return db.update(
      'recipes',
      recipe.toMap(),
      where: '${RecipeFields.id} = ?',
      whereArgs: [recipe.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    print("!!! Successed delete id = ${id} !!!");
    return await db.delete(
      'recipes',
      where: '${RecipeFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
