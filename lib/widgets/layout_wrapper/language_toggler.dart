import 'package:flutter/material.dart';
import 'package:oven/l10n/app_localizations.dart';
import 'package:oven/notifires/locale_provider.dart';

class LanguageToggler extends StatefulWidget {
  const LanguageToggler({super.key});

  @override
  State<LanguageToggler> createState() => _LanguageTogglerState();
}

class _LanguageTogglerState extends State<LanguageToggler> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: locale,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: () => {
            value.toString() == "en"
                ? locale.value = Locale('ar')
                : locale.value = Locale("en"),
          },
          child: Text(AppLocalizations.of(context)!.helloWorld),
        );
      },
    );
  }
}
