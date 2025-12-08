import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class ReaperCommissionEndpoint extends Endpoint {
  Future<List<ReaperCommission>> getByPackageId(
      Session session, int packageId) async {
    return await ReaperCommission.db.find(
      session,
      where: (t) => t.packageId.equals(packageId),

      // include: ReaperCommission.include(
      //   level: Level.include(),
      //   product: Product.include(),
      // ),
    );
  }

  // Future<ReaperCommission?> getSingle(Session session, int packageId, int levelId, int productId) async {
  //   return await ReaperCommission.db.findFirstRow(
  //     session,
  //     where: (t) => t.packageId.equals(packageId) & t.levelId.equals(levelId) & t.productId.equals(productId),
  //   );
  // }
}
