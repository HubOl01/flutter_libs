import 'package:bloc/bloc.dart';

import '../repositories/FavoriteRepository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteBloc(this.favoriteRepository) : super(FavoriteInitial()) {
    on<LoadFavorites>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final thoughts = await favoriteRepository.getAll();
        emit(FavoriteLoaded(thoughts));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<AddFavorite>((event, emit) async {
      try {
        await favoriteRepository.insert(event.model);
        add(LoadFavorites());
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<UpdateFavorite>((event, emit) async {
      try {
        await favoriteRepository.update(event.thought);
        add(LoadFavorites());
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<DeleteFavorite>((event, emit) async {
      try {
        await favoriteRepository.delete(event.id);
        add(LoadFavorites());
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });
  }
}
