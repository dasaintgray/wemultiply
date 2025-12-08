import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class GoldenSeatEndpoint extends Endpoint {
  Future<List<GoldenSeats>> getAllGoldenSeats(Session session) async {
    return await GoldenSeats.db.find(session);
  }

  Future<GoldenSeats?> getGoldenSeatById(Session session, int id) async {
    return await GoldenSeats.db.findById(session, id);
  }

  Future<GoldenSeats> createGoldenSeat(
      Session session, GoldenSeats goldenSeat) async {
    return await GoldenSeats.db.insertRow(session, goldenSeat);
  }

  Future<GoldenSeats> updateGoldenSeat(
      Session session, GoldenSeats goldenSeat) async {
    return await GoldenSeats.db.updateRow(session, goldenSeat);
  }

  Future<void> deleteGoldenSeat(Session session, int id) async {
    await GoldenSeats.db.deleteWhere(
      session,
      where: (record) => record.id.equals(id),
    );
  }
}
