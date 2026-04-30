import 'package:e_commerce_clothes/features/cart/bloc/cart_event.dart';
import 'package:e_commerce_clothes/features/cart/bloc/cart_state.dart';
import 'package:e_commerce_clothes/models/cartmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [], loadingItems: {}, addedItems: {})) {
    on<AddToCart>((event, emit) async {
      final id = event.product.id;

      if (state.addedItems.contains(id)) return;

      emit(state.copyWith(loadingItems: {...state.loadingItems, id}));

      await Future.delayed(Duration(seconds: 2));

      final items = List<CartModel>.from(state.items);

      final index = items.indexWhere((e) => e.clothesmodel.id == id);

      if (index != -1) {
        items[index].quantity++;
      } else {
        items.add(CartModel(clothesmodel: event.product));
      }

      emit(
        state.copyWith(
          items: items,
          loadingItems: state.loadingItems.where((e) => e != id).toSet(),
          addedItems: {...state.addedItems, id},
        ),
      );
    });

    on<RemoveFromCart>((event, emit) {
      final items = state.items
          .where((e) => e.clothesmodel.id != event.product.id)
          .toList();

      emit(
        state.copyWith(
          items: items,
          addedItems: Set.from(state.addedItems)..remove(event.product.id),
        ),
      );
    });
    on<IncreaseQuantity>((event, emit) {
      final items = List<CartModel>.from(state.items);

      final index = items.indexWhere(
        (e) => e.clothesmodel.id == event.product.id,
      );

      if (index != -1) {
        items[index].quantity++;
      }

      emit(state.copyWith(items: items));
    });

    on<DecreaseQuantity>((event, emit) {
      final items = List<CartModel>.from(state.items);

      final index = items.indexWhere(
        (e) => e.clothesmodel.id == event.product.id,
      );

      if (index != -1 && items[index].quantity > 1) {
        items[index].quantity--;
      }

      emit(state.copyWith(items: items));
    });
    on<ClearCart>((event, emit) {
      emit(CartState(items: [], loadingItems: {}, addedItems: {}));
    });
  }
}
