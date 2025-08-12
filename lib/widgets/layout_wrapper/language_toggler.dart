import 'package:flutter/material.dart';
import 'package:oven/l10n/app_localizations.dart';

class LanguageToggler extends StatefulWidget {
  const LanguageToggler({super.key});

  @override
  State<LanguageToggler> createState() => _LanguageTogglerState();
}

class _LanguageTogglerState extends State<LanguageToggler> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {setState(() {})},
      child: Text(AppLocalizations.of(context)!.helloWorld),
    );
  }
}
