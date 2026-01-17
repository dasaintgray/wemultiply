import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/repositories/cart_repository.dart';
import 'package:wm_flutter/core/spc_core.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<AddItemToCart>(addItemToCart);
    on<LoadCart>(loadCart);
    on<RemoveFromCart>(removeFromCart);
    on<UpdateCartItem>(updateCartItem);
    on<ClearCart>(_onClearCart);
    on<ClearCartAfterPayment>(_onClearCartAfterPayment);
    on<ConfirmCheckout>(onConfirmCHeckout);
  }

  Future<void> addItemToCart(
    AddItemToCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      // ignore: avoid_print
      print('=== addItemToCart: Adding product ${event.product.id} qty ${event.qty} ===');
      final updatedCart = await cartRepository.addToCart(
        event.product,
        event.qty,
      );
      if (updatedCart != null) {
        // ignore: avoid_print
        print('Cart returned: id=${updatedCart.id}, isActive=${updatedCart.isActive}, status=${updatedCart.status}, items=${updatedCart.cartItems?.length ?? 0}');
        // Emit CartLoaded with the updated cart so UI updates
        emit(CartLoaded([updatedCart]));
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error adding to cart: $e');
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

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartLoaded([]));
  }

  Future<void> _onClearCartAfterPayment(
    ClearCartAfterPayment event,
    Emitter<CartState> emit,
  ) async {
    // ignore: avoid_print
    print('=== ClearCartAfterPayment called for userId: ${event.userId} ===');
    try {
      // Clear cart on server
      final result = await SpcCore.client.cart.clearUserCart(event.userId);
      // ignore: avoid_print
      print('clearUserCart result: $result');
      // Clear local state
      emit(CartLoaded([]));
      // ignore: avoid_print
      print('Cart cleared locally');
    } catch (e) {
      // ignore: avoid_print
      print('Error clearing cart: $e');
      // Even if server call fails, clear local state
      emit(CartLoaded([]));
    }
  }
}
