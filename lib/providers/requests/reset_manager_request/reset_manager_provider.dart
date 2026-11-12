import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'reset_manager_provider.g.dart';

const _kKey = 'managers_reset_map';

typedef ResetEntry = ({String managerId, String link});

/// managerId -> generated reset link
@Riverpod(keepAlive: true)
class ResetManagers extends _$ResetManagers {
  late Future<void> _ready;

  @override
  Map<String, String> build() {
    _ready = _load();
    return const {};
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kKey);
    if (raw == null) return;
    state = Map<String, String>.from(jsonDecode(raw) as Map);
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kKey, jsonEncode(state));
  }

  /// Adds or replaces the link of every (managerId, link) in [entries].
  Future<void> setManagersToResetState(List<ResetEntry> entries) async {
    await _ready;
    if (entries.isEmpty) return;
    state = {...state, for (final e in entries) e.managerId: e.link};
    await _save();
  }

  Future<void> removeManagerFromResetState(String managerId) async {
    await _ready;
    if (!state.containsKey(managerId)) return;
    state = {
      for (final e in state.entries)
        if (e.key != managerId) e.key: e.value,
    };
    await _save();
  }
}
