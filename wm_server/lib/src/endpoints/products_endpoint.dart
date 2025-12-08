import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class ProductEndpoint extends Endpoint {
  // require login for all methods in this endpoint
  // @override
  // bool get requireLogin => true;

  Future<List<Product>> getAllProduct(Session session) async {
    final response = await Product.db.find(session);

    if (response.isEmpty) {
      throw Exception('No Product found');
    }
    return response;
  }

  Future<Product?> createProduct(Session session, Product product) async {
    final productResponse = await Product.db.insertRow(session, product);
    return productResponse;
  }

  Future<List<Product>> createProducts(
      Session session, List<Product> products) async {
    final response = await Product.db.insert(session, products);
    if (response.isEmpty) {
      throw Exception('Failed to create Product');
    }
    return response;
  }

  Future<Product?> getProductById(Session session, int id) async {
    final product = await Product.db.findById(session, id);
    if (product == null) {
      throw Exception('Product with id $id not found');
    }
    return product;
  }

  Future<Product?> updateProduct(Session session, Product product) async {
    final updatedProduct = await Product.db.updateRow(session, product);
    return updatedProduct;
  }

  Future<void> deleteProduct(Session session, Product prod) async {
    await Product.db.deleteRow(session, prod);
  }

  Future<void> deleteProductById(Session session, int id) async {
    await Product.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }
}
