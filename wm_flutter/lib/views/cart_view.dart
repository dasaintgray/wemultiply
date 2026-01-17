import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/views/login_view.dart';
import 'package:wm_flutter/views/payment_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  // Cache for product details
  static final Map<int, Product> _productCache = {};

  Future<Product?> _getProduct(int productId) async {
    if (_productCache.containsKey(productId)) {
      return _productCache[productId];
    }
    try {
      final product = await SpcCore.client.product.getProductById(productId);
      if (product != null) {
        _productCache[productId] = product;
      }
      return product;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              context.read<CartBloc>().add(ClearCart());
            },
          ),
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) async {
          if (state is CartCheckoutCompleted) {
            final order = state.order;
            final paymentSuccess = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentView(
                  orderId: order.id?.toString() ??
                      "ORD-${DateTime.now().millisecondsSinceEpoch}",
                  amount: order.grandTotal,
                  description: "Order #${order.id}",
                ),
              ),
            );

            // If payment was successful, clear the cart on server and reload
            if (paymentSuccess == true && context.mounted) {
              final userId = SpcCore.userId;
              if (userId != null) {
                context.read<CartBloc>().add(ClearCartAfterPayment(userId));
              } else {
                context.read<CartBloc>().add(ClearCart());
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Order placed successfully!"),
                  backgroundColor: AppColors.darkGreen,
                ),
              );
            } else if (context.mounted) {
              // Payment was cancelled or failed, reload cart to show items again
              final userId = SpcCore.userId;
              if (userId != null) {
                context.read<CartBloc>().add(LoadCart(userId));
              }
            }
          } else if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.dangerColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final carts = state.cartItems;

            if (carts.isEmpty) {
              return const Center(child: Text("Your cart is empty"));
            }

            // Get all cart items from all carts
            final allCartItems =
                carts.expand((cart) => cart.cartItems ?? []).toList();

            // Check if cart has items (either via cartItems list or totalItems)
            final hasItems =
                allCartItems.isNotEmpty || carts.any((cart) => cart.totalItems > 0);

            if (!hasItems) {
              return const Center(child: Text("Your cart is empty"));
            }

            // Calculate totals - use cartItems if available, otherwise use Cart totals
            final double subtotal;
            final int totalQuantity;

            if (allCartItems.isNotEmpty) {
              subtotal = allCartItems.fold<double>(
                0,
                (sum, item) => sum + item.totalPrice,
              );
              totalQuantity = allCartItems.fold<int>(
                0,
                (int sum, item) => sum + (item.quantity as int),
              );
            } else {
              // Fallback to Cart model totals
              subtotal =
                  carts.fold<double>(0, (sum, cart) => sum + cart.subtotal);
              totalQuantity =
                  carts.fold<int>(0, (sum, cart) => sum + cart.totalItems.toInt());
            }

            const shippingFee = 38.0;
            final total = subtotal + shippingFee;

            return Column(
              children: [
                Expanded(
                  child: allCartItems.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: allCartItems.length,
                          itemBuilder: (context, index) {
                            final item = allCartItems[index];
                            return FutureBuilder<Product?>(
                              future: _getProduct(item.productId),
                              builder: (context, snapshot) {
                                final product = snapshot.data;
                                final productName =
                                    product?.productName ?? 'Loading...';
                                final productDesc = product?.description ?? '';

                                return Card(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Product image placeholder
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: AppColors.darkGreen
                                                .withValues(alpha: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Icon(
                                            Icons.shopping_bag_outlined,
                                            color: AppColors.darkGreen,
                                            size: 32,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        // Product details
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productName,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              if (productDesc.isNotEmpty)
                                                Text(
                                                  productDesc,
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 12,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // Quantity
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 12,
                                                      vertical: 4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Text(
                                                      "Qty: ${item.quantity}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                  // Price
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "\u20B1${item.unitPrice.toStringAsFixed(2)}",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        "\u20B1${item.totalPrice.toStringAsFixed(2)}",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: AppColors
                                                              .darkGreen,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : Center(
                          child: Card(
                            margin: const EdgeInsets.all(16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 48,
                                    color: AppColors.darkGreen,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "$totalQuantity item(s) in cart",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Subtotal: \u20B1${subtotal.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.darkGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Items ($totalQuantity):"),
                          Text("\u20B1${subtotal.toStringAsFixed(2)}"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Shipping Fee:"), Text("\u20B138.00")],
                      ),
                      const Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\u20B1${total.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () => _handleCheckout(context, total),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.darkGreen,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            "Proceed to Checkout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _handleCheckout(BuildContext context, double total) {
    if (!SpcCore.isSignedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please sign in to checkout"),
          backgroundColor: AppColors.dangerColor,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView()));
      return;
    }

    // Create the order first via ConfirmCheckout, then the listener will navigate to PaymentView
    context.read<CartBloc>().add(
      ConfirmCheckout(SpcCore.userId!, 'PENDING'),
    );
  }
}
