import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class AddressEndpoint extends Endpoint {
  /// Get all addresses for the authenticated user
  Future<List<Addresses>> getAddressesByUserId(
      Session session, int userId) async {
    return await Addresses.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.isPrimary,
      orderDescending: true,
    );
  }

  /// Get primary address for a user
  Future<Addresses?> getPrimaryAddress(Session session, int userId) async {
    return await Addresses.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.isPrimary.equals(true),
    );
  }

  /// Add a new delivery address
  Future<Addresses> addAddress(Session session, Addresses address) async {
    final now = DateTime.now();

    // If this is the first address or marked as primary, update other addresses
    if (address.isPrimary) {
      await _clearPrimaryForUser(session, address.userId);
    }

    // Check if user has any addresses - if not, make this primary
    final existingCount = await Addresses.db.count(
      session,
      where: (t) => t.userId.equals(address.userId),
    );

    if (existingCount == 0) {
      address.isPrimary = true;
    }

    address.createdAt = now;
    address.updatedAt = now;

    return await Addresses.db.insertRow(session, address);
  }

  /// Update an existing address
  Future<Addresses> updateAddress(Session session, Addresses address) async {
    address.updatedAt = DateTime.now();

    // If setting as primary, clear other primary addresses
    if (address.isPrimary) {
      await _clearPrimaryForUser(session, address.userId);
    }

    return await Addresses.db.updateRow(session, address);
  }

  /// Delete an address
  Future<bool> deleteAddress(Session session, int addressId, int userId) async {
    final address = await Addresses.db.findById(session, addressId);

    if (address == null || address.userId != userId) {
      return false;
    }

    final wasPrimary = address.isPrimary;
    await Addresses.db.deleteRow(session, address);

    // If deleted address was primary, set another as primary
    if (wasPrimary) {
      final remaining = await Addresses.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(userId),
      );
      if (remaining != null) {
        remaining.isPrimary = true;
        remaining.updatedAt = DateTime.now();
        await Addresses.db.updateRow(session, remaining);
      }
    }

    return true;
  }

  /// Set an address as primary
  Future<Addresses?> setPrimaryAddress(
      Session session, int addressId, int userId) async {
    final address = await Addresses.db.findById(session, addressId);

    if (address == null || address.userId != userId) {
      return null;
    }

    await _clearPrimaryForUser(session, userId);

    address.isPrimary = true;
    address.updatedAt = DateTime.now();

    return await Addresses.db.updateRow(session, address);
  }

  /// Get address count for a user
  Future<int> getAddressCount(Session session, int userId) async {
    return await Addresses.db.count(
      session,
      where: (t) => t.userId.equals(userId),
    );
  }

  /// Helper to clear primary flag for all user addresses
  Future<void> _clearPrimaryForUser(Session session, int userId) async {
    final addresses = await Addresses.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.isPrimary.equals(true),
    );

    for (final addr in addresses) {
      addr.isPrimary = false;
      addr.updatedAt = DateTime.now();
      await Addresses.db.updateRow(session, addr);
    }
  }
}
