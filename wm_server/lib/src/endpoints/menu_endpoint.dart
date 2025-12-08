import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

class MenuEndpoint extends Endpoint {
  Future<List<Menu>?> getAllActiveMenus(Session session) async {
    final menus = await Menu.db.find(
      session,
      where: (q) => q.isActive.equals(true),
      orderBy: (o) => o.id,
      include: Menu.include(
        menuItems: MenuItems.includeList(
          where: (items) => items.isActive.equals(true),
          orderBy: (items) => items.id,
        ),
        eulaItems: Eula.includeList(),
      ),
    );
    if (menus.isNotEmpty) {
      return menus;
    }
    return [];
  }

  Future<Menu?> getMenuWithItems(Session session, int menuID) async {
    // return await Menu.db.findById(session, id);
    final response = await Menu.db.findById(
      session,
      menuID,
      include: Menu.include(
        menuItems: MenuItems.includeList(
          where: (items) => items.isActive.equals(true),
          orderBy: (items) => items.id,
        ),
      ),
    );
    if (response != null) {
      return response;
    }
    return null;
  }
}
