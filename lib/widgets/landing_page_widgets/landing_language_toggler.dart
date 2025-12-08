import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/locale_provider/locale_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class LandingLanguageToggler extends ConsumerWidget {
  const LandingLanguageToggler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isArabic =
        ref.read(appLocaleProvider).value?.languageCode == "ar";

    return Align(
      alignment: isArabic ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isPortrait ? 40 : 15,
          horizontal: 10,
        ),
        child: GestureDetector(
          onTap: () {
            ref
                .read(appLocaleProvider.notifier)
                .setLocale(isArabic ? const Locale("en") : const Locale("ar"));
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onSurface.withValues(
                    alpha: context.isDarkMode ? 0.8 : 0.4,
                  ),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 1,
                ),
              ],
            ),
            child: SizedBox(
              child: Text(
                key: ValueKey(isArabic),
                isArabic ? "En" : "عربى",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
