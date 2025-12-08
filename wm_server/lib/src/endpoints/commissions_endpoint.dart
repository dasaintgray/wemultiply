import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class CommissionsEndpoint extends Endpoint {
  // require login for all methods in this endpoint
  // @override
  // bool get requireLogin => true;

  Future<Commissions?> getCommissionById(Session session, int id) async {
    final commission = await Commissions.db.findById(session, id);
    if (commission == null) {
      throw Exception('Commission with id $id not found');
    }
    return commission;
  }

  Future<List<Commissions>> getAllCommissions(Session session) async {
    final response = await Commissions.db.find(session);

    if (response.isEmpty) {
      throw Exception('No commissions found');
    }
    return response;
  }

  Future<Commissions?> createCommission(
      Session session, Commissions commission) async {
    final result = await Commissions.db.insertRow(session, commission);

    return result;
  }

  Future<Commissions?> updateCommission(
      Session session, Commissions commission) async {
    final updatedCommission =
        await Commissions.db.updateRow(session, commission);

    return updatedCommission;
  }

  Future<void> deleteCommission(Session session, Commissions commission) async {
    await Commissions.db.deleteRow(session, commission);
  }

  Future<List<Commissions>> createMultipleCommissions(
      Session session, List<Commissions> commissions) async {
    final result = await Commissions.db.insert(session, commissions);
    if (result.isEmpty) {
      throw Exception('Failed to create commissions');
    }
    return result;
  }
}
