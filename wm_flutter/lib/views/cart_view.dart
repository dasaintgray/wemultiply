import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/views/login_view.dart';
import 'package:wm_flutter/views/payment_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
        listener: (context, state) {
          if (state is CartCheckoutCompleted) {
            final order = state.order;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentView(
                  orderId:
                      order.id?.toString() ??
                      "ORD-${DateTime.now().millisecondsSinceEpoch}",
                  amount: order.grandTotal,
                  description: "Order #${order.id}",
                ),
              ),
            );
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
            final allCartItems = carts
                .expand((cart) => cart.cartItems ?? [])
                .toList();
            final subtotal = allCartItems.fold<double>(
              0,
              (sum, item) => sum + item.totalPrice,
            );
            const shippingFee = 38.0;
            final total = subtotal + shippingFee;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: allCartItems.length,
                    itemBuilder: (context, index) {
                      final item = allCartItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          title: Text("Product #${item.productId}"),
                          subtitle: Text("Qty: ${item.quantity}"),
                          trailing: Text(
                            "\u20B1${item.totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
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
                          const Text("Subtotal:"),
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentView(
          orderId: "ORD-${DateTime.now().millisecondsSinceEpoch}",
          amount: total,
          description: "Cart Checkout",
        ),
      ),
    );
  }
}
