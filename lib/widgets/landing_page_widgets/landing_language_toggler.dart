import 'package:flutter/material.dart';
import 'package:oven/notifires/locale_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class LandingLanguageToggler extends StatefulWidget {
  const LandingLanguageToggler({super.key});

  @override
  State<LandingLanguageToggler> createState() => _LandingLanguageTogglerState();
}

class _LandingLanguageTogglerState extends State<LandingLanguageToggler> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: locale,
      builder: (context, value, child) {
        final bool isEnglish = value.toString() == "en";
        return Align(
          alignment: value.toString() == "ar"
              ? Alignment.topRight
              : Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.isPortrait ? 40 : 15,
              horizontal: 10,
            ),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    color: context.isDarkMode
                        ? Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: .8)
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: .4),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: GestureDetector(
                key: const ValueKey("langToggle"),
                onTap: () {
                  locale.value = isEnglish
                      ? const Locale('ar')
                      : const Locale("en");
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Text(
                    isEnglish ? "عربى" : "En",
                    key: ValueKey(isEnglish),
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
      },
    );
  }
}
