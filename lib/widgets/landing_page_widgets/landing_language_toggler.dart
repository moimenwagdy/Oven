import 'package:flutter/material.dart';
import 'package:oven/notifires/locale_provider.dart';
import 'package:oven/utils/constants/colors.dart';

class LandingLanguageToggler extends StatelessWidget {
  const LandingLanguageToggler({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: locale,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: FloatingActionButton.small(
            backgroundColor: onPrimary.withOpacity(.4),
            onPressed: () => {
              value.toString() == "en"
                  ? locale.value = Locale('ar')
                  : locale.value = Locale("en"),
            },
            child: Text(
              value.toString() == "en" ? "عربى" : "En",
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: onSecondary),
            ),
          ),
        );
      },
    );
  }
}
