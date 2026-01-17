import 'package:serverpod/serverpod.dart' hide Order;
import 'package:wm_server/src/generated/protocol.dart';

class CartEndpoint extends Endpoint {
  Future<List<Cart>> getCartByUserId(Session session, int userId) async {
    final carts = await Cart.db.find(
      session,
      where: (t) => t.userID.equals(userId) & t.isActive.equals(true),
      include: Cart.include(cartItems: CartItem.includeList()),
    );
    return carts;
  }

  Future<void> removeFromCart(Session session, Cart cart) async {
    await Cart.db.deleteRow(session, cart);
  }

  Future<Cart?> updateCartItem(Session session, Cart cart) async {
    final updatedCart = await Cart.db.updateRow(session, cart);
    return updatedCart;
  }

  Future<int> getCartItemCount(Session session, int userId) async {
    // First find active carts for the user
    final activeCarts = await Cart.db.find(
      session,
      where: (t) => t.userID.equals(userId) & t.isActive.equals(true),
    );

    if (activeCarts.isEmpty) {
      return 0;
    }

    // Count cart items only from active carts
    int totalItems = 0;
    for (final cart in activeCarts) {
      if (cart.id != null) {
        final itemCount = await CartItem.db.count(
          session,
          where: (t) => t.cartId.equals(cart.id!),
        );
        totalItems += itemCount;
      }
    }
    return totalItems;
  }

  Future<Cart?> addItemToCart(
    Session session, {
    required int userID,
    required int productID,
    required int quantity,
  }) async {
    //find active cart for user
    var cart = await Cart.db.findFirstRow(
      session,
      where: (t) => t.userID.equals(userID) & t.isActive.equals(true),
      include: Cart.include(cartItems: CartItem.includeList()),
    );

    //if no active cart, try to find an inactive one to reactivate
    if (cart == null) {
      // Look for any existing cart for this user (inactive)
      cart = await Cart.db.findFirstRow(
        session,
        where: (t) => t.userID.equals(userID),
        include: Cart.include(cartItems: CartItem.includeList()),
      );

      if (cart != null) {
        // Reactivate the existing cart and clear old items
        session.log('Reactivating existing cart ${cart.id} for user $userID');

        // Delete old cart items
        if (cart.id != null) {
          final oldItems = await CartItem.db.find(
            session,
            where: (t) => t.cartId.equals(cart!.id!),
          );
          for (final item in oldItems) {
            await CartItem.db.deleteRow(session, item);
          }
        }

        // Reset cart to fresh state
        cart.isActive = true;
        cart.status = 'draft';
        cart.totalItems = 0;
        cart.subtotal = 0;
        cart.discountTotal = 0;
        cart.taxTotal = 0;
        cart.shippingTotal = 0;
        cart.grandTotal = 0;
        cart.couponCode = '';
        cart.updatedAt = DateTime.now();
        cart.expiresAt = DateTime.now().add(const Duration(days: 1));
        cart.notes = '';
        cart.cartItems = [];
        cart = await Cart.db.updateRow(session, cart);
      } else {
        // No cart exists at all, create a new one
        final newCart = Cart(
          userID: userID,
          status: 'draft',
          currency: 'PHP',
          totalItems: 0,
          subtotal: 0,
          discountTotal: 0,
          taxTotal: 0,
          shippingTotal: 0,
          grandTotal: 0,
          couponCode: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          expiresAt: DateTime.now().add(const Duration(days: 1)),
          notes: '',
          isActive: true,
          cartItems: [],
        );
        cart = await Cart.db.insertRow(session, newCart);
      }
    }

    //get product info
    final product = await Product.db.findById(session, productID);
    if (product == null) {
      throw Exception('Product not found');
    }

    //check if product is already in cart
    var cartItem = await CartItem.db.findFirstRow(
      session,
      where: (c) => c.cartId.equals(cart!.id) & c.productId.equals(product.id),
    );

    if (cartItem != null) {
      //update quantity
      cartItem.quantity += quantity;
      cartItem.totalPrice = cartItem.quantity * cartItem.unitPrice;
      await CartItem.db.updateRow(session, cartItem);
    } else {
      //add new item
      if (cart.id == null && product.id == null) {
        throw Exception('Cart ID and Product ID is null');
      }
      cartItem = CartItem(
        cartId: cart.id!,
        productId: product.id!,
        quantity: quantity,
        unitPrice: product.price,
        totalPrice: product.price * quantity,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await CartItem.db.insertRow(session, cartItem);
    }

    // 5️⃣ Recalculate cart totals
    final items = await CartItem.db.find(
      session,
      where: (t) => t.cartId.equals(cart!.id),
    );

    cart.totalItems = items.fold(0, (sum, i) => sum + i.quantity);
    cart.subtotal = items.fold(0, (sum, i) => sum + i.totalPrice);
    cart.grandTotal = cart.subtotal; // adjust if you have tax/discount logic
    cart.updatedAt = DateTime.now();

    await Cart.db.updateRow(session, cart);

    // 6️⃣ Return updated cart
    return await Cart.db.findById(
      session,
      cart.id!,
      include: Cart.include(cartItems: CartItem.includeList()),
    );
  }

  Future<Order?> checkOutCart(
    Session session, {
    required int userID,
    required String paymentMethod,
  }) async {
    final dtNow = DateTime.now();
    //1: Find active cart
    final cart = await Cart.db.findFirstRow(
      session,
      where: (u) => u.userID.equals(userID) & u.isActive.equals(true),
      include: Cart.include(cartItems: CartItem.includeList()),
    );

    if (cart == null) {
      throw Exception('No Active cart found');
    }

    //2: create new ORder Record
    final order = Order(
      userID: userID,
      cartId: cart.id!,
      status: "SALE",
      currency: 'PHP',
      subtotal: cart.subtotal,
      taxTotal: cart.taxTotal,
      shippingTotal: cart.shippingTotal,
      discountTotal: cart.discountTotal,
      grandTotal: cart.grandTotal,
      paymentMethod: paymentMethod,
      createdAt: dtNow,
      updatedAt: dtNow,
    );

    final insertOrder = await Order.db.insertRow(session, order);

    //3 Copy cart items = order items
    for (final item in cart.cartItems ?? []) {
      final orderItem = OrderItem(
        orderId: insertOrder.id!,
        productId: item.productID,
        quantity: item.quantity,
        unitPrice: item.unitPrice,
        totalPrice: item.totalPrice,
        createdAt: dtNow,
        updatedAt: dtNow,
      );
      await OrderItem.db.insertRow(session, orderItem);
    }

    // mark cart inactive
    cart.isActive = false;
    cart.status = 'completed';
    cart.updatedAt = dtNow;
    await Cart.db.updateRow(session, cart);

    // returl full order
    return await Order.db.findById(
      session,
      insertOrder.id!,
      include: Order.include(
        orderItems: OrderItem.includeList(),
      ),
    );
  }

  /// Mark order as paid and clear the cart after successful payment
  Future<bool> markOrderPaidAndClearCart(
    Session session, {
    required int userId,
    required String orderId,
  }) async {
    final dtNow = DateTime.now();

    session.log('=== markOrderPaidAndClearCart called ===');
    session.log('userId: $userId, orderId: $orderId');

    // Find the order by orderId (which is the cart id in string form or order reference)
    Order? order;

    // First try to find by order ID if it's numeric
    final orderIdInt = int.tryParse(orderId);
    if (orderIdInt != null) {
      order = await Order.db.findById(session, orderIdInt);
      session.log('Order lookup by ID $orderIdInt: ${order != null ? 'found' : 'not found'}');
    }

    // If not found, try to find the most recent order for this user
    if (order == null) {
      order = await Order.db.findFirstRow(
        session,
        where: (t) => t.userID.equals(userId),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
      );
      session.log('Order lookup by userId $userId (most recent): ${order != null ? 'found id=${order.id}' : 'not found'}');
    }

    if (order != null) {
      // Update order status to PAID
      order.status = 'PAID';
      order.updatedAt = dtNow;
      await Order.db.updateRow(session, order);
      session.log('Order ${order.id} marked as PAID');
    }

    // Find and deactivate all carts for this user
    final carts = await Cart.db.find(
      session,
      where: (t) => t.userID.equals(userId) & t.isActive.equals(true),
    );

    session.log('Found ${carts.length} active carts for userId: $userId');

    for (final cart in carts) {
      session.log('Marking cart ${cart.id} as paid (was: status=${cart.status}, isActive=${cart.isActive})');
      cart.isActive = false;
      cart.status = 'paid';
      cart.updatedAt = dtNow;
      await Cart.db.updateRow(session, cart);
      session.log('Cart ${cart.id} marked as paid successfully');
    }

    return true;
  }

  /// Clear all active carts for a user (used after successful payment)
  Future<bool> clearUserCart(Session session, int userId) async {
    final dtNow = DateTime.now();

    session.log('clearUserCart called for userId: $userId');

    // Find all active carts for this user
    final carts = await Cart.db.find(
      session,
      where: (t) => t.userID.equals(userId) & t.isActive.equals(true),
    );

    session.log('Found ${carts.length} active carts for userId: $userId');

    // Mark all carts as inactive/cleared
    for (final cart in carts) {
      session.log('Clearing cart id: ${cart.id}, status: ${cart.status}, isActive: ${cart.isActive}');
      cart.isActive = false;
      cart.status = 'cleared';
      cart.updatedAt = dtNow;
      await Cart.db.updateRow(session, cart);
      session.log('Cart ${cart.id} cleared successfully');
    }

    return true;
  }

  /// Debug method to check cart status for a user
  Future<Map<String, dynamic>> debugCartStatus(Session session, int userId) async {
    final allCarts = await Cart.db.find(
      session,
      where: (t) => t.userID.equals(userId),
    );

    final activeCarts = allCarts.where((c) => c.isActive).toList();
    final inactiveCarts = allCarts.where((c) => !c.isActive).toList();

    int totalActiveItems = 0;
    for (final cart in activeCarts) {
      if (cart.id != null) {
        final itemCount = await CartItem.db.count(
          session,
          where: (t) => t.cartId.equals(cart.id!),
        );
        totalActiveItems += itemCount;
      }
    }

    return {
      'userId': userId,
      'totalCarts': allCarts.length,
      'activeCarts': activeCarts.length,
      'inactiveCarts': inactiveCarts.length,
      'totalActiveItems': totalActiveItems,
      'activeCartIds': activeCarts.map((c) => c.id).toList(),
      'activeCartStatuses': activeCarts.map((c) => '${c.id}:${c.status}:${c.isActive}').toList(),
    };
  }
}
