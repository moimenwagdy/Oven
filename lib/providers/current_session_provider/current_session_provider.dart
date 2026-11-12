import 'dart:async';

import 'package:oven/models/auth_session.dart';
import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/current_session_provider/session_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_session_provider.g.dart';

/// Holds the logged-in user, or null. The user id is saved on login and
/// cleared on sign out, so the session survives app restarts.
@Riverpod(keepAlive: true)
class CurrentSession extends _$CurrentSession {
  @override
  AuthSession? build() => null;

  /// Restores the saved session. Call it once at app start, before runApp,
  /// so the first frame already knows who is logged in.
  Future<void> restore() async {
    // Read everything needed before the awaits.
    final storage = ref.read(sessionStorageProvider);
    final repository = ref.read(authRepositoryProvider);

    final userId = await storage.readUserId();
    if (userId == null) return;

    final session = await repository.restoreSession(userId);
    if (session == null) {
      // The saved user no longer exists.
      await storage.clear();
      return;
    }

    // Someone may have logged in while this was running.
    if (state != null) return;
    state = session;
  }

  /// A fresh login or signup.
  void setSession(AuthSession session) {
    state = session;
    unawaited(ref.read(sessionStorageProvider).saveUserId(session.id));
  }

  /// Replaces the session only if it is still the same user, so a slow
  /// request cannot log someone back in after they signed out.
  void replaceIfSameUser(AuthSession session) {
    if (state?.id == session.id) state = session;
  }

  void signOut() {
    state = null;
    unawaited(ref.read(sessionStorageProvider).clear());
  }
}

/// Id of the logged-in user (manager or personal), or null.
@riverpod
String? currentUserId(Ref ref) => ref.watch(currentSessionProvider)?.id;
