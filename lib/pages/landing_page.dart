import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';
import 'package:oven/widgets/landing_page_widgets/landing_language_toggler.dart';
import 'package:oven/widgets/landing_page_widgets/landing_navigation_buttons.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              : const LandingLanguageToggler(),
          if (context.isPortrait) const SizedBox(height: 20),
          OvenLogo(
            minW: context.isSmallDevice ? 240.h : 280.h,
            maxW: context.isSmallDevice ? 260.h : 300.h,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: const LandingNavigationButtons(),
            ),
          ),
        ],
      ),
    );
  }
}
