import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/shopping_item.dart';

class StorageService {
  static const _key = 'shopping_items';

  Future<List<ShoppingItem>> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key) ?? [];
    return data.map((item) => ShoppingItem.fromMap(jsonDecode(item))).toList();
  }

  Future<void> saveItems(List<ShoppingItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final data = items.map((e) => jsonEncode(e.toMap())).toList();
    await prefs.setStringList(_key, data);
  }
}
