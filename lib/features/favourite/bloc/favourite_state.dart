import 'package:e_commerce_clothes/models/clothesmodel.dart';

class FavoriteState {
  final List<Clothesmodel> favorites;

  FavoriteState({required this.favorites});

  bool isFavorite(int id) {
    return favorites.any((item) => item.id == id);
  }

  FavoriteState copyWith({
    List<Clothesmodel>? favorites,
  }) {
    return FavoriteState(
      favorites: favorites ?? this.favorites,
    );
  }
}