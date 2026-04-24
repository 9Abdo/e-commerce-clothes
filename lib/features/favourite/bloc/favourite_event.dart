import 'package:e_commerce_clothes/models/clothesmodel.dart';

abstract class FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final Clothesmodel product;

  ToggleFavorite(this.product);
}