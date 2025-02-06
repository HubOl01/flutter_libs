const String tableName = "favorite";

class Favorites {
  static final List<String> values = [id, title, isFavorite, createdAt];
  static const String id = "id";
  static const String title = "title";
  static const String isFavorite = "isFavorite";
  static const String createdAt = "createdAt";
}

class FavoriteModel {
  final int? id;
  final String title;
  final int isFavorite;
  final DateTime createdAt;

  FavoriteModel({
    this.id,
    required this.title,
    this.isFavorite = 0,
    required this.createdAt,
  });
  FavoriteModel copyWith({
    int? id,
    String? title,
    int? isFavorite,
    DateTime? createdAt,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isFavorite': isFavorite,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory FavoriteModel.fromJson(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      title: map['title'],
      isFavorite: map['isFavorite'],
      createdAt: DateTime.parse(map['createdAt'] as String)
    );
  }
}
