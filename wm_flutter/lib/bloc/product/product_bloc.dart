import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    // on<ProductEvent>((event, emit) {});
    // on<LoadProducts>((event, emit) async {
    //   await loadProducts(event, emit);
    // });
    on<LoadProduct>(loadProducts);
    on<AddProduct>(addProduct);
    // on<DeleteProduct>(deleteProduct);
    on<LoadProductById>(onLoadProductById);
  }

  Future<void> loadProducts(
    LoadProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await productRepository.fetchProducts();
      emit(ProductsLoaded(products));
      log('Loaded products: ${products.length}');
    } catch (e) {
      log('Error fetching products: $e');
      emit(ProductError('Failed to load products: $e'));
    }
  }

  Future<void> onLoadProductById(
    LoadProductById event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final product = await productRepository.fetchProductById(event.productId);
      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> addProduct(AddProduct event, Emitter<ProductState> emit) async {
    try {
      final product = await productRepository.addProduct(event.products);
      final currentState = state;
      if (currentState is ProductsLoaded) {
        emit(ProductsLoaded([...currentState.product, product!]));
      }
    } catch (e) {
      emit(ProductError('Failed to add product: $e'));
    }
  }

  // Future<void> deleteProduct(DeleteProduct event, Emitter<ProductState> emit) async {
  //   try {
  //     await productRepository.deleteProductById(event.productId);
  //     final currentState = state;
  //     if (currentState is ProductsLoaded) {
  //       emit(ProductsLoaded(
  //         currentState.product.where((element) => element.id != event.productId).toList(),
  //       ));
  //     }
  //   } catch (e) {
  //     emit(ProductError('Failed to delete product: $e'));
  //   }
  // }
}
