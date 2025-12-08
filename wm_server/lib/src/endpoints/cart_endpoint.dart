import 'package:serverpod/serverpod.dart' hide Order;
import 'package:wm_server/src/generated/protocol.dart';

class CartEndpoint extends Endpoint {
  Future<List<Cart>> getCartByUserId(Session session, int userId) async {
    final cartItems = await Cart.db.find(
      session,
      where: (t) => t.userID.equals(userId),
    );
    return cartItems;
  }

  Future<void> removeFromCart(Session session, Cart cart) async {
    await Cart.db.deleteRow(session, cart);
  }

  Future<Cart?> updateCartItem(Session session, Cart cart) async {
    final updatedCart = await Cart.db.updateRow(session, cart);
    return updatedCart;
  }

  Future<int> getCartItemCount(Session session, int userId) async {
    final count = await Cart.db.count(
      session,
      where: (t) => t.userID.equals(userId),
    );
    return count;
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

    //if no active cart, create one
    if (cart == null) {
      cart = Cart(
        userID: userID,
        // sessionID: session.sessionId,
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
      await Cart.db.insertRow(session, cart);
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
}
