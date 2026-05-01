import 'dart:async';
import 'package:e_commerce_clothes/features/favourite/bloc/favourite_event.dart';
import 'package:e_commerce_clothes/features/favourite/bloc/favourite_state.dart';
import 'package:e_commerce_clothes/services/favourie_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteService service;
  late final StreamSubscription _favSub;

  FavoriteBloc(this.service)
      : super(FavoriteState(favorites: [])) {

    on<ToggleFavorite>((event, emit) async {
      await service.toggleFavorite(event.product);
    });

    _favSub = service.getFavorites().listen((favorites) {
      add(UpdateFavoritesFromFirebase(favorites));
    });
    
    on<UpdateFavoritesFromFirebase>((event, emit) {
      emit(state.copyWith(favorites: event.favorites));
    });
  }

  @override
  Future<void> close() {
    _favSub.cancel();
    return super.close();
  }
}