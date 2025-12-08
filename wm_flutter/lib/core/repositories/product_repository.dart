import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/spc_core.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      final products = await SpcCore.client.product.getAllProduct();
      return products;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<Product> fetchProductById(int id) async {
    try {
      final product = await SpcCore.client.product.getProductById(id);
      return product!;
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }

  Future<Product?> addProduct(Product product) async {
    try {
      final response = await SpcCore.client.product.createProduct(product);
      return response;
    } catch (e) {
      throw Exception('Failed to create product: $e');
    }
  }

  Future<List<Product>> addProducts(List<Product> products) async {
    try {
      final response = await SpcCore.client.product.createProducts(products);
      return response;
    } catch (e) {
      throw Exception('Failed to create products: $e');
    }
  }

  Future<void> deleteProductById(int id) async {
    try {
      await SpcCore.client.product.deleteProductById(id);
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }
}
