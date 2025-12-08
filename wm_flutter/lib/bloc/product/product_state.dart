part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> product;
  const ProductsLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductLoaded extends ProductState {
  final Product product;
  const ProductLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
