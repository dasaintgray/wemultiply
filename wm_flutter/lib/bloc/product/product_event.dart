part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProduct extends ProductEvent {}

class LoadProductById extends ProductEvent {
  final int productId;
  const LoadProductById(this.productId);

  @override
  List<Object?> get props => [productId];
}

class AddProduct extends ProductEvent {
  final Product products;
  const AddProduct(this.products);

  @override
  List<Object?> get props => [products];
}

class DeleteProduct extends ProductEvent {
  final int productId;
  const DeleteProduct(this.productId);

  @override
  List<Object?> get props => [productId];
}
