part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartItemSuccess extends CartState {
  final String message;

  const CartItemSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

final class CartLoaded extends CartState {
  final List<Cart> cartItems;
  const CartLoaded(this.cartItems);

  @override
  List<Object?> get props => [cartItems];
}

final class CartError extends CartState {
  final String message;
  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}

final class CartCheckoutCompleted extends CartState {
  final Order order;
  const CartCheckoutCompleted(this.order);

  @override
  List<Object?> get props => [order];
}
