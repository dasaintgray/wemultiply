import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class CommissionsRuleEndpoint extends Endpoint {
  // require login for all methods in this endpoint
  @override
  bool get requireLogin => true;

  Future<List<CommissionRule>> getAllCommissionRules(Session session) async {
    final result = await CommissionRule.db.find(session);

    if (result.isEmpty) {
      throw Exception("No commission rules found");
    }
    return result;
  }

  Future<CommissionRule?> createCommissionRule(
      Session session, CommissionRule rule) async {
    final result = await CommissionRule.db.insertRow(session, rule);
    return result;
  }

  Future<List<CommissionRule>> createMultipleCommissionRules(
      Session session, List<CommissionRule> rules) async {
    final result = await CommissionRule.db.insert(session, rules);
    return result;
  }

  Future<CommissionRule?> getCommissionRuleById(Session session, int id) async {
    final rule = await CommissionRule.db.findById(session, id);
    return rule;
  }

  Future<CommissionRule?> updateCommissionRule(
      Session session, CommissionRule rule) async {
    final updatedRule = await CommissionRule.db.updateRow(session, rule);
    return updatedRule;
  }

  Future<void> deleteCommissionRule(
      Session session, CommissionRule rule) async {
    await CommissionRule.db.deleteRow(session, rule);
  }
}
