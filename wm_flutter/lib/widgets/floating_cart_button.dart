import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/views/cart_view.dart';

/// A floating cart button that shows the cart item count
/// and navigates to CartView when tapped.
/// Only visible when the cart has items.
class FloatingCartButton extends StatelessWidget {
  const FloatingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int itemCount = 0;
        if (state is CartLoaded) {
          itemCount = state.cartItems
              .expand((cart) => cart.cartItems ?? [])
              .length;
        }

        // Only show if cart has items
        if (itemCount == 0) {
          return const SizedBox.shrink();
        }

        return FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<CartBloc>(),
                  child: const CartView(),
                ),
              ),
            );
          },
          backgroundColor: AppColors.darkGreen,
          icon: Badge(
            label: Text(
              itemCount.toString(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: AppColors.dangerColor,
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          label: const Text(
            'Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

/// A small circular floating cart button (alternative style)
class FloatingCartButtonSmall extends StatelessWidget {
  const FloatingCartButtonSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int itemCount = 0;
        if (state is CartLoaded && state.cartItems.isNotEmpty) {
          // Try to get count from cartItems list first
          final cartItemsCount = state.cartItems
              .expand((cart) => cart.cartItems ?? [])
              .length;

          if (cartItemsCount > 0) {
            itemCount = cartItemsCount;
          } else {
            // Fallback to totalItems from Cart model
            itemCount = state.cartItems
                .fold<int>(0, (sum, cart) => sum + cart.totalItems.toInt());
          }
        }

        // Only show if cart has items
        if (itemCount == 0) {
          return const SizedBox.shrink();
        }

        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<CartBloc>(),
                  child: const CartView(),
                ),
              ),
            );
          },
          backgroundColor: AppColors.darkGreen,
          child: Badge(
            label: Text(
              itemCount.toString(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: AppColors.dangerColor,
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
