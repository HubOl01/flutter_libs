# Templates

## Database using SQFlite

example model

`lib/core/models/userTreeModel.dart`
```dart
const String tableName = "user_tree";

class UserTrees {
  static final List<String> values = [
    id,
    idTree,
    timer,
    xTree,
    yTree,
    createdAt
  ];
  static const String id = "id";
  static const String idTree = "idTree";
  static const String timer = "timer";
  static const String xTree = "xTree";
  static const String yTree = "yTree";
  static const String createdAt = "createdAt";
}

class UserTreeModel {
  final int? id;
  final int idTree;
  final int timer;
  final int xTree;
  final int yTree;
  final DateTime createdAt;

  UserTreeModel({
    this.id,
    required this.idTree,
    required this.timer,
    required this.xTree,
    required this.yTree,
    required this.createdAt,
  });

  UserTreeModel copy(
          {int? id,
          int? idTree,
          int? timer,
          int? xTree,
          int? yTree,
          DateTime? createdAt}) =>
      UserTreeModel(
        id: id ?? this.id,
        idTree: idTree ?? this.idTree,
        timer: timer ?? this.timer,
        xTree: xTree ?? this.xTree,
        yTree: yTree ?? this.yTree,
        createdAt: createdAt ?? this.createdAt,
      );

  factory UserTreeModel.fromJson(Map<String, dynamic> json) => UserTreeModel(
        id: json[UserTrees.id],
        idTree: json[UserTrees.timer],
        timer: json[UserTrees.timer],
        xTree: json[UserTrees.xTree],
        yTree: json[UserTrees.yTree],
        createdAt: DateTime.parse(json[UserTrees.createdAt]),
      );

  Map<String, dynamic> toJson() => {
        UserTrees.id: id,
        UserTrees.idTree: idTree,
        UserTrees.timer: timer,
        UserTrees.xTree: xTree,
        UserTrees.yTree: yTree,
        UserTrees.createdAt: createdAt.toIso8601String(),
      };
}

```


`lib/core/data/database.dart`

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;
  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final intType = 'INTEGER';
    await db.execute('''
            CREATE TABLE ${tableName}(
              ${UserTrees.id} ${idType},
              ${UserTrees.idTree} ${intType},
              ${UserTrees.timer} ${intType},
              ${UserTrees.xTree} ${intType},
              ${UserTrees.yTree} ${intType},
              ${UserTrees.createdAt} ${textType}
            )
          ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<void> insertDB(UserTreeModel model) async {
    final db = await instance.database;
    await db.insert(tableName, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("!!! Successful create id = ${model.toJson()} !!!");
  }

  Future<List<UserTreeModel>> readAllDB() async {
    final db = await instance.database;

    const orderBy = '${UserTrees.createdAt} DESC';
    final result = await db.query(tableName, orderBy: orderBy);
    print("!!! Successful readAll ${result.toString()}!!!");

    return result.map((json) => UserTreeModel.fromJson(json)).toList();
  }

  Future<void> updateDB(UserTreeModel model) async {
    final db = await instance.database;
    print("!!! Successful update ${model.toString()}!!!");
    await db.update(
      tableName,
      model.toJson(),
      where: '${UserTrees.id} = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> deleteDB(int id) async {
    final db = await instance.database;
    print("!!! Successful delete ${id.toString()}!!!");
    await db.delete(
      tableName,
      where: '${UserTrees.id} = ?',
      whereArgs: [id],
    );
  }
}
```
