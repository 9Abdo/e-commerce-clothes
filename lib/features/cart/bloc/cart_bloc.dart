import 'package:e_commerce_clothes/features/cart/bloc/cart_event.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_state.dart';
import 'package:e_commerce_clothes/models/cartmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddToCart>((event, emit) {
      final items = List<CartModel>.from(state.items);

      final index = items.indexWhere(
        (e) => e.clothesmodel.id == event.product.id,
      );

      if (index != -1) {
        items[index].quantity++;
      } else {
        items.add(CartModel(clothesmodel: event.product));
      }

      emit(CartState(items));
    });

    on<RemoveFromCart>((event, emit) {
      final items = state.items
          .where((e) => e.clothesmodel.id != event.product.id)
          .toList();

      emit(CartState(items));
    });

    on<IncreaseQuantity>((event, emit) {
      final items = List<CartModel>.from(state.items);

      final index = items.indexWhere(
        (e) => e.clothesmodel.id == event.product.id,
      );

      if (index != -1) {
        items[index].quantity++;
      }

      emit(CartState(items));
    });

    on<DecreaseQuantity>((event, emit) {
      final items = List<CartModel>.from(state.items);

      final index = items.indexWhere(
        (e) => e.clothesmodel.id == event.product.id,
      );

      if (index != -1 && items[index].quantity > 1) {
        items[index].quantity--;
      }

      emit(CartState(items));
    });
  }
}
