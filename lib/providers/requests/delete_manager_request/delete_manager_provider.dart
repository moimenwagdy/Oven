import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'delete_manager_provider.g.dart';

const _kDeletedManagersKey = 'deleted_manager_request';

@Riverpod(keepAlive: true)
class DeletedManagers extends _$DeletedManagers {
  // Completes when the saved links have been loaded into state.
  // Mutations await it so they can never overwrite storage with a partial list.
  late final Future<void> _ready;

  @override
  List<String> build() {
    _ready = _load();
    return const [];
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = List<String>.unmodifiable(
      prefs.getStringList(_kDeletedManagersKey) ?? const <String>[],
    );
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kDeletedManagersKey, state);
  }

  Future<void> setManagerStateToDeleted(List<String> deletedManagersIds) async {
    await _ready;
    final existing = state.toSet();
    final fresh = deletedManagersIds.where(existing.add).toList();
    if (fresh.isEmpty) return;
    state = [...fresh, ...state]; // newest first
    await _save();
  }

  Future<void> undoDeletedManager(String managerId) async {
    await _ready;
    debugPrint('Before: ${state.length}');
    debugPrint('Manager exists: ${state.contains(managerId)}');
    state = state.where((l) => l != managerId).toList();
    debugPrint('After: ${state.length}');
    debugPrint('Updated state: $state');

    await _save();
  }

  Future<void> deleteAll(String managerId) async {
    await _ready;

    state = [];

    await _save();
  }
}
