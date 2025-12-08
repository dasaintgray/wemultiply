import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/spc_core.dart';

class CartRepository {
  // This is a placeholder for the actual implementation.
  // The methods here should correspond to the server endpoints defined in CartsEndpoint.

  // Future<Cart?> addToCart(Cart cart) async {
  //   try {
  //     final response = await SpcCore.client.cart.addToCart(cart);
  //     return response;
  //   } catch (e) {
  //     throw Exception('Failed to add to cart: $e');
  //   }
  // }

  Future<Cart?> addToCart(Product product, int quantity) async {
    final response = await SpcCore.client.cart.addItemToCart(
      userID: SpcCore.userId!,
      productID: product.id!,
      quantity: quantity,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Order?> checkoutCart({
    required int userID,
    required String paymentMethod,
  }) async {
    return await SpcCore.client.cart.checkOutCart(
      userID: userID,
      paymentMethod: paymentMethod,
    );
  }

  Future<List<Cart>> getCartByUserId(int userId) async {
    try {
      final cartItems = await SpcCore.client.cart.getCartByUserId(userId);
      return cartItems;
    } catch (e) {
      throw Exception('Failed to load cart items: $e');
    }
  }

  //
  Future<void> removeFromCart(Cart cart) async {
    try {
      await SpcCore.client.cart.removeFromCart(cart);
    } catch (e) {
      throw Exception('Failed to remove from cart: $e');
    }
  }

  Future<Cart?> updateCartItem(Cart cart) async {
    try {
      final updatedCart = await SpcCore.client.cart.updateCartItem(cart);
      return updatedCart;
    } catch (e) {
      throw Exception('Failed to update cart item: $e');
    }
  }

  Future<int> getCartItemCount(int userId) async {
    try {
      final count = await SpcCore.client.cart.getCartItemCount(userId);
      return count;
    } catch (e) {
      throw Exception('Failed to get cart item count: $e');
    }
  }
}
