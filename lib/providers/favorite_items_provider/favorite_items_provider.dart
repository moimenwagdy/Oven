import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorite_items_provider.g.dart';

@riverpod
class FavoriteItemsPro extends _$FavoriteItemsPro {
  static const _storageKey = "favorite_items";

  @override
  Future<List<String>> build() async {
    final loaded = await _loadFromStorage();
    state = AsyncData(loaded);
    return loaded;
  }

  Future<List<String>> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) {
      return [];
    }

    try {
      final decoded = List<String>.from(jsonDecode(jsonString));
      return decoded;
    } catch (e) {
      return [];
    }
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();

    final encoded = jsonEncode(state.value);
    await prefs.setString(_storageKey, encoded);
  }

  void addToFavorites(String id) {
    final currentList = state.value ?? [];
    final updatedList = [id, ...currentList];
    state = AsyncData(updatedList);
    _saveToStorage();
  }

  void removeFromFavorites(String id) {
    final currentList = state.value ?? [];
    final updatedList = currentList.where((ele) => ele != id).toList();
    state = AsyncData(updatedList);
    _saveToStorage();
  }
}
