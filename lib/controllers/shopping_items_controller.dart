import 'package:flutter_riverpod/legacy.dart';
import 'package:uuid/uuid.dart';
import '../features/data/local_storage/shopping_local_storage.dart';
import '../features/data/models/shopping_item.dart';

final shoppingControllerProvider =
    StateNotifierProvider<ShoppingController, List<ShoppingItem>>((ref) {
  return ShoppingController(StorageService());
});

class ShoppingController extends StateNotifier<List<ShoppingItem>> {
  final StorageService _storage;
  ShoppingController(this._storage) : super([]) {
    loadItems();
  }

  Future<void> loadItems() async {
    final items = await _storage.loadItems();
    state = items;
  }

  Future<void> addItem(String name) async {
    final newItem = ShoppingItem(id: const Uuid().v4(), name: name);
    state = [...state, newItem];
    await _storage.saveItems(state);
  }

  Future<void> editItem(String id, String newName) async {
    state = [
      for (final item in state)
        if (item.id == id) ShoppingItem(id: id, name: newName) else item
    ];
    await _storage.saveItems(state);
  }

  Future<void> deleteItem(String id) async {
    state = state.where((item) => item.id != id).toList();
    await _storage.saveItems(state);
  }
}
