import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/spc_core.dart';

class MenuRepository {
  // Repository methods go here

  Future<List<Menu>?> fetchMenus() async {
    try {
      final menus = await SpcCore.client.menu.getAllActiveMenus();
      return menus;
    } catch (e) {
      throw Exception('Failed to load menus: $e');
    }
  }
}
