import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/oven_logo.dart';
import 'package:oven/widgets/landing_page_widgets/landing_language_toggler.dart';
import 'package:oven/widgets/landing_page_widgets/landing_navigation_buttons.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  DateTime? _lastPressedAt;
  final int _exitDurationSeconds = 2;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final now = DateTime.now();
        if (_lastPressedAt == null ||
            now.difference(_lastPressedAt!) >
                Duration(seconds: _exitDurationSeconds)) {
          _lastPressedAt = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  'Press BACK again to exit',
                  style: TextStyle(color: primary),
                ),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
          );
          setState(() {});
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            context.isPortrait
                ? Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            context.isDarkMode
                                ? "lib/assets/Cakes_dark.webp"
                                : "lib/assets/Cakes3-2.webp",
                            fit: context.isPortrait
                                ? BoxFit.cover
                                : BoxFit.contain,
                            width: double.infinity,
                          ),
                          const LandingLanguageToggler(),
                        ],
                      ),
                    ],
                  )
                : const LandingLanguageToggler(key: ValueKey("landingToggler")),
            if (context.isPortrait) const SizedBox(height: 20),
            OvenLogo(
              minW: context.isSmallDevice ? 240.h : 280.h,
              maxW: context.isSmallDevice ? 260.h : 300.h,
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: SingleChildScrollView(child: LandingNavigationButtons()),
            ),
          ],
        ),
      ),
    );
  }
}
