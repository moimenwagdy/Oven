import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'locale_provider.g.dart';

@riverpod
class AppLocale extends _$AppLocale {
  static const _key = "selected_locale";

  @override
  Future<Locale> build() async {
    final saved = await _loadLocaleFromStorage();
    return Locale(saved ?? "en");
  }

  Future<void> setLocale(Locale locale) async {
    state = AsyncData(locale);
    await _saveLocaleToStorage(locale);
  }

  Future<String?> _loadLocaleFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);
    return saved;
  }

  Future<void> _saveLocaleToStorage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageCode);
  }
}








