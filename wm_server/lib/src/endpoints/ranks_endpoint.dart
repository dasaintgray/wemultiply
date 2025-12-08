import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class RanksEndpoint extends Endpoint {
  // require login for all methods in this endpoint
  @override
  bool get requireLogin => true;

  // required scopes for all methods in this endpoint
  // @override
  // Set<Scope> get requiredScopes => {Scope.admin};

  Future<List<Ranks>> getAllRanks(Session session) async {
    final result = await Ranks.db.find(session);

    if (result.isEmpty) {
      throw Exception("No ranks found");
    }
    return result;
  }

  Future<Ranks?> createRanks(Session session, Ranks rank) async {
    final result = await Ranks.db.insertRow(session, rank);
    return result;
  }

  Future<List<Ranks>> createMultipleRanks(
      Session session, List<Ranks> ranks) async {
    final result = await Ranks.db.insert(session, ranks);
    return result;
  }

  Future<Ranks?> getRankById(Session session, int id) async {
    final rank = await Ranks.db.findById(session, id);
    return rank;
  }

  Future<Ranks?> updateRank(Session session, Ranks rank) async {
    final updatedRank = await Ranks.db.updateRow(session, rank);
    return updatedRank;
  }

  Future<void> deleteRank(Session session, Ranks rank) async {
    await Ranks.db.deleteRow(session, rank);
  }
}
