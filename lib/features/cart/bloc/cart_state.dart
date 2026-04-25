import 'package:e_commerce_clothes/models/cartmodel.dart';

class CartState {
  final List<CartModel> items;

  CartState(this.items);

  double get total {
    return items.fold(
      0,
      (sum, item) => sum + item.clothesmodel.price * item.quantity,
    );
  }
}