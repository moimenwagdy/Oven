import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'session_storage.g.dart';

const _kSessionUserIdKey = 'session_user_id';

/// Remembers who is logged in, across app restarts.
/// DEV VERSION: saves the user id in SharedPreferences. When the real API
/// arrives, this class saves the auth token in secure storage instead, and
/// nothing outside it changes.
class SessionStorage {
  Future<String?> readUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_kSessionUserIdKey);
    } catch (e) {
      debugPrint('Could not read the saved session: $e');
      return null;
    }
  }

  Future<void> saveUserId(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kSessionUserIdKey, userId);
    } catch (e) {
      debugPrint('Could not save the session: $e');
    }
  }

  Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_kSessionUserIdKey);
    } catch (e) {
      debugPrint('Could not clear the saved session: $e');
    }
  }
}

@Riverpod(keepAlive: true)
SessionStorage sessionStorage(Ref ref) => SessionStorage();
