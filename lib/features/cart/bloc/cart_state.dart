import 'package:e_commerce_clothes/models/cartmodel.dart';

class CartState {
  final List<CartModel> items;
  final Set<int> loadingItems;   
  final Set<int> addedItems;    

  CartState({
    required this.items,
    required this.loadingItems,
    required this.addedItems,
  });

  double get total {
    return items.fold(
      0,
      (sum, item) => sum + item.clothesmodel.price * item.quantity,
    );
  }

  bool isInCart(int productId) {
    return items.any((item) => item.clothesmodel.id == productId);
  }

  CartState copyWith({
    List<CartModel>? items,
    Set<int>? loadingItems,
    Set<int>? addedItems,
  }) {
    return CartState(
      items: items ?? this.items,
      loadingItems: loadingItems ?? this.loadingItems,
      addedItems: addedItems ?? this.addedItems,
    );
  }
}