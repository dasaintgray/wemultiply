import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class PackageEndpoint extends Endpoint {
  Future<List<Package>> getAllPackages(Session session) async {
    final response = await Package.db.find(
      session,
      where: (p) => p.isActive.equals(true),
      include: Package.include(
        packageId: ReaperCommission.includeList(),
      ),
    );
    if (response.isEmpty) {
      throw Exception('No Package found');
    }
    return response;
  }

  Future<Package?> createPackage(Session session, Package package) async {
    final packageResponse = await Package.db.insertRow(session, package);
    return packageResponse;
  }

  Future<Package?> getPackageById(Session session, int id) async {
    final package = await Package.db.findById(session, id);
    if (package == null) {
      throw Exception('Package with id $id not found');
    }
    return package;
  }

  Future<Package?> updatePackage(Session session, Package package) async {
    final updatedPackage = await Package.db.updateRow(session, package);
    return updatedPackage;
  }

  Future<void> deletePackage(Session session, Package pkg) async {
    await Package.db.deleteRow(session, pkg);
  }
}
