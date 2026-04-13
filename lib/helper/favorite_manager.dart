import 'package:flutter/material.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';

class FavoriteManager {
  static Set<int> favorites = {};
  static List<Clothesmodel> allClothes = [];
  static ValueNotifier<Set<int>> favoritesNotifier =
      ValueNotifier(favorites);

  static void toggleFavorite(int id) {
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    favoritesNotifier.value = Set.from(favorites);
  }

  static bool isFavorite(int id) {
    return favorites.contains(id);
  }

  static void setClothes(List<Clothesmodel> clothes) {
    allClothes = clothes;
  }

  static List<Clothesmodel> getFavorites() {
    return allClothes
        .where((item) => favorites.contains(item.id))
        .toList();
  }
}