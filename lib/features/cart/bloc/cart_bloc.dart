import 'dart:async';

import 'package:e_commerce_clothes/features/cart/bloc/cart_event.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_state.dart';
import 'package:e_commerce_clothes/models/cartmodel.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';
import 'package:e_commerce_clothes/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService service;
  late final StreamSubscription _cartSub;

  CartBloc(this.service)
      : super(CartState(items: [], loadingItems: {}, addedItems: {})) {

    on<AddToCart>((event, emit) async {
      final id = event.product.id;

      if (state.addedItems.contains(id)) return;

      emit(state.copyWith(
        loadingItems: {...state.loadingItems, id},
      ));

      await service.addToCart(event.product);

      emit(state.copyWith(
        loadingItems: Set.from(state.loadingItems)..remove(id),
        addedItems: {...state.addedItems, id},
      ));
    });

    on<RemoveFromCart>((event, emit) async {
      await service.removeFromCart(event.product.id);
    });

    on<IncreaseQuantity>((event, emit) async {
      await service.increaseQuantity(event.product.id);
    });

    on<DecreaseQuantity>((event, emit) async {
      await service.decreaseQuantity(event.product.id);
    });

    on<ClearCart>((event, emit) async {
      await service.clearCart();
    });

    _cartSub = service.getCart().listen((items) {
      final cartItems = items.map((e) {
        return CartModel(
          clothesmodel: Clothesmodel(
            id: e.id,
            image: e.image,
            clothesType: e.title,
            price: e.price,
            description: "",
          ),
          quantity: e.quantity,
        );
      }).toList();

      add(UpdateCartFromFirebase(cartItems));
    });

    on<UpdateCartFromFirebase>((event, emit) {
      emit(state.copyWith(items: event.items));
    });
  }

  @override
  Future<void> close() {
    _cartSub.cancel();
    return super.close();
  }
}