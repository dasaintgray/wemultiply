import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/core/utils/format_utils.dart';
import 'package:wm_flutter/views/login_view.dart';
import 'package:wm_flutter/views/payment_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.pearl,
      appBar: AppBar(
        backgroundColor: AppColors.pearl,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.charcoal),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Cart',
          style: theme.textTheme.headlineMedium,
        ),
        centerTitle: false,
        actions: [
          TextButton.icon(
            onPressed: () {
              context.read<CartBloc>().add(ClearCart());
            },
            icon: const Icon(Icons.delete_outline_rounded, size: 18),
            label: const Text('Clear'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.coral,
            ),
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

            if (paymentSuccess == true && context.mounted) {
              final userId = SpcCore.userId;
              if (userId != null) {
                context.read<CartBloc>().add(ClearCartAfterPayment(userId));
              } else {
                context.read<CartBloc>().add(ClearCart());
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Order placed successfully!")),
              );
            } else if (context.mounted) {
              final userId = SpcCore.userId;
              if (userId != null) {
                context.read<CartBloc>().add(LoadCart(userId));
              }
            }
          } else if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.coral,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.emerald),
            );
          } else if (state is CartLoaded) {
            final carts = state.cartItems;

            if (carts.isEmpty) {
              return _buildEmptyCart(context, theme);
            }

            final allCartItems =
                carts.expand((cart) => cart.cartItems ?? []).toList();
            final hasItems =
                allCartItems.isNotEmpty || carts.any((cart) => cart.totalItems > 0);

            if (!hasItems) {
              return _buildEmptyCart(context, theme);
            }

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
              subtotal = carts.fold<double>(0, (sum, cart) => sum + cart.subtotal);
              totalQuantity =
                  carts.fold<int>(0, (sum, cart) => sum + cart.totalItems.toInt());
            }

            const shippingFee = 38.0;
            final total = subtotal + shippingFee;

            return Column(
              children: [
                // Cart count badge
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.warmWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          '$totalQuantity item${totalQuantity > 1 ? 's' : ''}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Cart items list
                Expanded(
                  child: allCartItems.isNotEmpty
                      ? AnimationLimiter(
                          child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                            itemCount: allCartItems.length,
                            itemBuilder: (context, index) {
                              final item = allCartItems[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 350),
                                child: SlideAnimation(
                                  verticalOffset: 20,
                                  child: FadeInAnimation(
                                    child: _CartItemCard(
                                      item: item,
                                      getProduct: _getProduct,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Text(
                            "$totalQuantity item(s) • ${FormatUtils.currencyFormatter.format(subtotal)}",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                ),
                // Summary panel
                _CartSummary(
                  subtotal: subtotal,
                  shippingFee: shippingFee,
                  total: total,
                  totalQuantity: totalQuantity,
                  onCheckout: () => _handleCheckout(context, total),
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline_rounded,
                      size: 48, color: AppColors.coral),
                  const SizedBox(height: 12),
                  Text("Error: ${state.message}", style: theme.textTheme.bodyMedium),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context, ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.sage.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 44,
                color: AppColors.emerald,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Your cart is empty',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Looks like you haven\'t added\nanything to your cart yet.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.slate,
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Start Shopping'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleCheckout(BuildContext context, double total) {
    if (!SpcCore.isSignedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please sign in to checkout")),
      );
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView()));
      return;
    }

    context.read<CartBloc>().add(
      ConfirmCheckout(SpcCore.userId!, 'PENDING'),
    );
  }
}

// ═══════════════════════════════════════════════
// CART ITEM CARD
// ═══════════════════════════════════════════════

class _CartItemCard extends StatelessWidget {
  final dynamic item;
  final Future<Product?> Function(int) getProduct;

  const _CartItemCard({required this.item, required this.getProduct});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cdnServer = CoreConstant.serverCDN;

    return FutureBuilder<Product?>(
      future: getProduct(item.productId),
      builder: (context, snapshot) {
        final product = snapshot.data;
        final productName = product?.productName ?? 'Loading...';
        final productDesc = product?.description ?? '';
        final hasImage = product != null && product.isActive;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.warmWhite,
            borderRadius: BorderRadius.circular(18),
            border: Border(
              left: BorderSide(color: AppColors.emerald, width: 3),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.forest.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 76,
                  height: 76,
                  color: AppColors.pearl,
                  child: hasImage
                      ? cacheNetworkImage(
                          '${cdnServer}api/cdn/download/images/${product.imageName}',
                          width: 76,
                          height: 76,
                          boxFit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.sage,
                          size: 32,
                        ),
                ),
              ),
              const SizedBox(width: 14),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: theme.textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (productDesc.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        productDesc,
                        style: theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Quantity control
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.pearl,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _QtyButton(
                                icon: Icons.remove,
                                onTap: () {},
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  '${item.quantity}',
                                  style: theme.textTheme.titleSmall,
                                ),
                              ),
                              _QtyButton(
                                icon: Icons.add,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        // Price
                        Text(
                          FormatUtils.currencyFormatter.format(item.totalPrice),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.forest,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Icon(icon, size: 16, color: AppColors.graphite),
      ),
    );
  }
}

// ═══════════════════════════════════════════════
// CART SUMMARY
// ═══════════════════════════════════════════════

class _CartSummary extends StatelessWidget {
  final double subtotal;
  final double shippingFee;
  final double total;
  final int totalQuantity;
  final VoidCallback onCheckout;

  const _CartSummary({
    required this.subtotal,
    required this.shippingFee,
    required this.total,
    required this.totalQuantity,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      decoration: BoxDecoration(
        color: AppColors.warmWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: AppColors.forest.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SummaryRow(
              label: 'Subtotal',
              value: FormatUtils.currencyFormatter.format(subtotal),
              theme: theme,
            ),
            const SizedBox(height: 8),
            _SummaryRow(
              label: 'Shipping Fee',
              value: FormatUtils.currencyFormatter.format(shippingFee),
              theme: theme,
            ),
            const SizedBox(height: 8),
            _SummaryRow(
              label: 'Discount',
              value: '−₱0.00',
              theme: theme,
              valueColor: AppColors.emerald,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: CustomPaint(
                painter: _DashedLinePainter(),
                size: const Size(double.infinity, 1),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  FormatUtils.currencyFormatter.format(total),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.forest,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: onCheckout,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Proceed to Checkout'),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_rounded, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final ThemeData theme;
  final Color? valueColor;

  const _SummaryRow({
    required this.label,
    required this.value,
    required this.theme,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.slate)),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: valueColor ?? AppColors.charcoal,
          ),
        ),
      ],
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.mist
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
