import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/landing_page_widgets/landing_page_border_with_text_between_top_border.dart';
import 'package:oven/widgets/landing_page_widgets/landing_navigation_button.dart';
import 'package:oven/widgets/landing_page_widgets/skip_landing_page.dart';

class LandingNavigationButtons extends StatelessWidget {
  const LandingNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 10.h),
            BorderWithTextBetweenTopBorder(
              widgetChild: Column(
                children: [
                  LandingNavigathionButton(
                    child: context.l10n.currentMerchant,
                    destination: "/login/currentMerchant",
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: .7),
                  ),
                  SizedBox(height: 15.h),
                  LandingNavigathionButton(
                    child: context.l10n.newMerchant,
                    color: Theme.of(
                      context,
                    ).colorScheme.surface.withValues(alpha: .6),
                    destination: "/signup/newMerchant",
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: .1),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -12),
                        child: Container(
                          color: Theme.of(context).colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 2,
                          ),
                          child: Text(
                            context.l10n.personalOperations,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontSize: 12,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  LandingNavigathionButton(
                    child: context.l10n.personalCustomer,
                    destination: "/login/personal",
                    color: Theme.of(
                      context,
                    ).colorScheme.surface.withValues(alpha: .7),
                  ),
                ],
              ),
              headMessage: context.l10n.tradingOperations,
            ),

            SizedBox(height: 15.h),
            SkipLandingPage(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
