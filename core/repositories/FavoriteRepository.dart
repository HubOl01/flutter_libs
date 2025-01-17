import 'package:never_stop_scrolling/core/models/favoriteModel.dart';

import '../data/database.dart';

class FavoriteRepository {
  final dbHelper = DatabaseHelper();

  Future<int> insert(FavoriteModel model) async {
    final db = await dbHelper.database;
    return await db.insert(tableName, model.toJson());
  }

  Future<List<FavoriteModel>> getAll() async {
    final db = await dbHelper.database;
    const orderBy = '`${Favorites.id}` DESC';
    final result = await db.query(tableName, orderBy: orderBy);
    return result.map((e) => FavoriteModel.fromJson(e)).toList();
  }

  Future<int> update(FavoriteModel argue) async {
    final db = await dbHelper.database;
    return await db.update(
      tableName,
      argue.toJson(),
      where: '${Favorites.id} = ?',
      whereArgs: [argue.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      tableName,
      where: '${Favorites.id} = ?',
      whereArgs: [id],
    );
  }
}
