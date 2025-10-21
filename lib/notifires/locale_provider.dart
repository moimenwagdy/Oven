import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<Locale> locale = ValueNotifier( Locale('en'));


class LocaleProvider {
  static const _key = 'selected_locale';

  static Future<void> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(_key);
    if (savedCode != null) {
      locale.value = Locale(savedCode);
    }
  }

  static Future<void> saveLocale(Locale newLocale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, newLocale.languageCode);
    locale.value = newLocale;
  }
}