import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;
import 'package:wm_client/wm_client.dart' hide UserInfo;
import 'package:wm_flutter/core/spc_core.dart';

class AdminRepository {
  /// Get all users from the admin endpoint
  Future<List<auth.UserInfo>> getAllUsers() async {
    return await SpcCore.client.admin.getAllUsers();
  }

  /// Block a user by their ID
  Future<void> blockUser(int userId) async {
    await SpcCore.client.admin.blockUser(userId);
  }

  /// Unblock a user by their ID
  Future<void> unblockUser(int userId) async {
    await SpcCore.client.admin.unblockUser(userId);
  }

  /// Get all products
  Future<List<Product>> getAllProducts() async {
    return await SpcCore.client.product.getAllProduct();
  }

  /// Delete a product by ID
  Future<void> deleteProduct(int productId) async {
    await SpcCore.client.product.deleteProductById(productId);
  }

  /// Create a new product
  Future<Product?> createProduct(Product product) async {
    return await SpcCore.client.product.createProduct(product);
  }

  /// Update a product
  Future<Product?> updateProduct(Product product) async {
    return await SpcCore.client.product.updateProduct(product);
  }

  /// Get dashboard statistics
  Future<Map<String, dynamic>> getDashboardStats() async {
    try {
      // Get all users count
      final users = await SpcCore.client.admin.getAllUsers();
      final totalUsers = users.length;

      // Get all products count
      final products = await SpcCore.client.product.getAllProduct();
      final totalProducts = products.length;

      // Add order and revenue endpoints when available
      // For now, return placeholder values
      return {
        'totalUsers': totalUsers,
        'totalProducts': totalProducts,
        'totalOrders': 0,
        'totalRevenue': 0.0,
      };
    } catch (e) {
      return {
        'totalUsers': 0,
        'totalProducts': 0,
        'totalOrders': 0,
        'totalRevenue': 0.0,
      };
    }
  }
}
