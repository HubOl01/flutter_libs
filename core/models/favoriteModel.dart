const String tableName = "favorite";

class Favorites {
  static final List<String> values = [id, title, isFavorite];
  static const String id = "id";
  static const String title = "title";
  static const String isFavorite = "isFavorite";
}

class FavoriteModel {
  final int? id;
  final String title;
  final int isFavorite;

  FavoriteModel({
    this.id,
    required this.title,
    this.isFavorite = 0,
  });
  FavoriteModel copyWith({
    int? id,
    String? title,
    int? isFavorite,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isFavorite': isFavorite,
    };
  }

  factory FavoriteModel.fromJson(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      title: map['title'],
      isFavorite: map['isFavorite'],
    );
  }
}
