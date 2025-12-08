import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'where_to_deliver_provider.g.dart';

@riverpod
class RadioList extends _$RadioList {
  static const _storageKey = "whereToDevlicerAdress";

  @override
  String build() {
    _loadFromStorage();
    return "١٢٣ شارع النيل، الزمالك، القاهرة، مصر";
  }

  void selectedAdress(String index) {
    state = index;
    _saveToStorage();
  }

  Future<void> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) return;

    final String decoded = jsonDecode(jsonString);

    state = decoded;
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(state);
    await prefs.setString(_storageKey, encoded);
  }
}
