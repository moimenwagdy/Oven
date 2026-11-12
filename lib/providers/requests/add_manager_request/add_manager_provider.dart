import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_manager_provider.g.dart';

const _kGeneratedLinksKey = 'manager_generated_links';

@Riverpod(keepAlive: true)
class AddManagerGeneratedLinks extends _$AddManagerGeneratedLinks {
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
      prefs.getStringList(_kGeneratedLinksKey) ?? const <String>[],
    );
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kGeneratedLinksKey, state);
  }

  Future<void> addGeneratedLink(String link) async {
    await _ready;
    if (state.contains(link)) return;
    state = [link, ...state]; // newest first
    await _save();
  }

  Future<void> deleteGeneratedLink(String link) async {
    await _ready;
    if (!state.contains(link)) return;
    state = state.where((l) => l != link).toList();
    await _save();
  }
}
