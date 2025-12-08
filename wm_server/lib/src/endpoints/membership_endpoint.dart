import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class MembershipEndpoint extends Endpoint {
  // Membership endpoint implementation

  Future<List<MembershipPackage>> getAllMembershipPackages(
      Session session) async {
    return await MembershipPackage.db.find(session);
  }

  Future<MembershipPackage?> getMembershipPackageById(
      Session session, int id) async {
    return await MembershipPackage.db.findById(session, id);
  }

  Future<MembershipPackage> createMembershipPackage(
      Session session, MembershipPackage package) async {
    return await MembershipPackage.db.insertRow(session, package);
  }

  Future<MembershipPackage> updateMembershipPackage(
      Session session, MembershipPackage package) async {
    return await MembershipPackage.db.updateRow(session, package);
  }

  Future<void> deleteMembershipPackage(Session session, int id) async {
    await MembershipPackage.db.deleteWhere(
      session,
      where: (record) => record.id.equals(id),
    );
  }
}
