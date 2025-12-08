import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class SaleEndpoint extends Endpoint {
  //Insert Sale Header and its detail lines
  Future<Sale?> insertSaleWithItems(Session session, Sale sale) async {
    return await session.db.transaction(
      (transaction) async {
        // Insert Sale Header first
        final insertedSale =
            await Sale.db.insertRow(session, sale, transaction: transaction);

        // Prepare each detail line with the saleId
        var items = sale.salesItems ?? [];
        for (var item in items) {
          item.saleId = insertedSale.id!;
        }

        // Insert all detail lines
        await SaleItem.db.insert(session, items, transaction: transaction);

        //return the inserted header
        insertedSale.salesItems = items;
        return insertedSale;
      },
    );
  }

  //Get Sales with their detail lines
  Future<List<Sale>?> getSalesWithItems(Session session, int saleID) async {
    // Fetch all sales
    final sale = await Sale.db.findById(
      session,
      saleID,
      include: Sale.include(
        salesItems: SaleItem.includeList(),
      ),
    );

    if (sale != null) {
      return [sale];
    }

    return null;
  }
}
