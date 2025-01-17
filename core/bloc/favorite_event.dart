import 'package:equatable/equatable.dart';

import '../models/favoriteModel.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoriteEvent {}

class AddFavorite extends FavoriteEvent {
  final FavoriteModel model;

  AddFavorite(this.model);

  @override
  List<Object?> get props => [model];
}

class UpdateFavorite extends FavoriteEvent {
  final FavoriteModel thought;

  UpdateFavorite(this.thought);

  @override
  List<Object?> get props => [thought];
}

class DeleteFavorite extends FavoriteEvent {
  final int id;

  DeleteFavorite(this.id);

  @override
  List<Object?> get props => [id];
}
