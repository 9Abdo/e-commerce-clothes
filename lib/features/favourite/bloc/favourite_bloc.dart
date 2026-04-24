import 'package:e_commerce_clothes/features/favourite/bloc/favourite_event.dart';
import 'package:e_commerce_clothes/features/favourite/bloc/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_clothes/models/clothesmodel.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState([])) {
    on<ToggleFavorite>((event, emit) {
      final currentList = List<Clothesmodel>.from(state.favorites);

      if (currentList.any((item) => item.id == event.product.id)) {
        currentList.removeWhere((item) => item.id == event.product.id);
      } else {
        currentList.add(event.product);
      }

      emit(FavoriteState(currentList));
    });
  }
}