import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class DistributorsEndpoint extends Endpoint {
  // require login for all methods in this endpoint
  @override
  bool get requireLogin => true;

  Future<List<Distributors>> getAllDistributors(Session session) async {
    final result = await Distributors.db.find(session);

    if (result.isEmpty) {
      throw Exception("No distributors found");
    }
    return result;
  }

  Future<Distributors?> createDistributor(
      Session session, Distributors distributor) async {
    final result = await Distributors.db.insertRow(session, distributor);
    return result;
  }

  Future<List<Distributors>> createMultipleDistributors(
      Session session, List<Distributors> distributors) async {
    final result = await Distributors.db.insert(session, distributors);
    return result;
  }

  Future<Distributors?> getDistributorById(Session session, int id) async {
    final distributor = await Distributors.db.findById(session, id);
    return distributor;
  }

  Future<Distributors?> updateDistributor(
      Session session, Distributors distributor) async {
    final updatedDistributor =
        await Distributors.db.updateRow(session, distributor);
    return updatedDistributor;
  }
}
