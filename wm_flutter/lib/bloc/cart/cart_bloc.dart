import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    // on<CartEvent>((event, emit) {});
    on<AddItemToCart>(addItemToCart);
  }

  Future<void> addItemToCart(
    AddItemToCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      final updateCart = await cartRepository.addToCart(
        event.product,
        event.qty,
      );
      if (updateCart != null) {
        emit(CartItemSuccess('Item successfully added to cart'));
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> onConfirmCHeckout(
    ConfirmCheckout event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      final order = await cartRepository.checkoutCart(
        userID: event.userID,
        paymentMethod: event.paymentMethod,
      );
      emit(CartCheckoutCompleted(order!));
    } catch (er) {
      emit(CartError(er.toString()));
    }
  }

  Future<void> loadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cartItems = await cartRepository.getCartByUserId(event.userId);
      emit(CartLoaded(cartItems));
    } catch (e) {
      emit(CartError('Failed to load cart items: $e'));
    }
  }

  // Future<void> addToCart(AddToCart event, Emitter<CartState> emit) async {
  //   try {
  //     final cartItem = await cartRepository.addToCart(event.cart);
  //     final currentState = state;
  //     if (currentState is CartLoaded) {
  //       emit(CartLoaded([...currentState.cartItems, cartItem!]));
  //     }
  //   } catch (e) {
  //     emit(CartError('Failed to add to cart: $e'));
  //   }
  // }

  Future<void> removeFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      await cartRepository.removeFromCart(event.cart);
      final currentState = state;
      if (currentState is CartLoaded) {
        emit(
          CartLoaded(
            currentState.cartItems
                .where((item) => item.id != event.cart.id)
                .toList(),
          ),
        );
      }
    } catch (e) {
      emit(CartError('Failed to remove from cart: $e'));
    }
  }

  Future<void> updateCartItem(
    UpdateCartItem event,
    Emitter<CartState> emit,
  ) async {
    try {
      final updatedCartItem = await cartRepository.updateCartItem(event.cart);
      final currentState = state;
      if (currentState is CartLoaded && updatedCartItem != null) {
        final updatedCartItems = currentState.cartItems.map((item) {
          return item.id == updatedCartItem.id ? updatedCartItem : item;
        }).toList();
        emit(CartLoaded(updatedCartItems));
      }
    } catch (e) {
      emit(CartError('Failed to update cart item: $e'));
    }
  }
}
