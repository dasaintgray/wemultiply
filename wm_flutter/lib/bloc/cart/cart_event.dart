part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class ClearCart extends CartEvent {}

/// Clear cart on server and locally after successful payment
class ClearCartAfterPayment extends CartEvent {
  final int userId;
  const ClearCartAfterPayment(this.userId);

  @override
  List<Object?> get props => [userId];
}

class CheckoutCart extends CartEvent {}

class IncreaseQuantity extends CartEvent {
  final int productID;

  const IncreaseQuantity(this.productID);

  @override
  List<Object?> get props => [productID];
}

class DecreasedQuantity extends CartEvent {
  final int productID;

  const DecreasedQuantity(this.productID);

  @override
  List<Object?> get props => [productID];
}

class UpdateItemSelection extends CartEvent {
  final int productID;
  final bool isSelected;
  const UpdateItemSelection(this.productID, this.isSelected);

  @override
  List<Object?> get props => [productID, isSelected];
}

class LoadCart extends CartEvent {
  final int userId;
  const LoadCart(this.userId);
}

class AddToCart extends CartEvent {
  final int userId;
  final Cart cart;
  const AddToCart(this.userId, this.cart);

  @override
  List<Object?> get props => [userId, cart];
}

class RemoveFromCart extends CartEvent {
  final int userId;
  final Cart cart;
  const RemoveFromCart(this.userId, this.cart);

  @override
  List<Object?> get props => [userId, cart];
}

class UpdateCartItem extends CartEvent {
  final int userId;
  final Cart cart;
  const UpdateCartItem(this.userId, this.cart);

  @override
  List<Object?> get props => [userId, cart];
}

class AddItemToCart extends CartEvent {
  final Product product;
  final int qty;

  const AddItemToCart(this.product, this.qty);

  @override
  List<Object?> get props => [product, qty];
}

class ConfirmCheckout extends CartEvent {
  final int userID;
  final String paymentMethod;

  const ConfirmCheckout(this.userID, this.paymentMethod);

  @override
  List<Object?> get props => [userID, paymentMethod];
}
