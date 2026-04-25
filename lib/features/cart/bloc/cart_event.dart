import 'package:e_commerce_clothes/models/clothesmodel.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Clothesmodel product;
  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final Clothesmodel product;
  RemoveFromCart(this.product);
}

class IncreaseQuantity extends CartEvent {
  final Clothesmodel product;
  IncreaseQuantity(this.product);
}

class DecreaseQuantity extends CartEvent {
  final Clothesmodel product;
  DecreaseQuantity(this.product);
}