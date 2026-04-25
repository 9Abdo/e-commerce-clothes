import 'package:e_commerce_clothes/models/clothesmodel.dart';

class CartModel {
  final Clothesmodel clothesmodel;
  int quantity;

  CartModel({
    required this.clothesmodel,
    this.quantity = 1,
  });
}