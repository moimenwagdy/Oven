import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/login_page_widgets/google_facebook_apple_icons/login_with_google_apple_facebook.dart';
import 'package:oven/widgets/login_page_widgets/or_use_credentials.dart';

class FrameAroundFormsWithTextBetweenTops extends StatelessWidget {
  final Widget child;
  final String type;
  const FrameAroundFormsWithTextBetweenTops({
    super.key,
    required this.child,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNewMerchant = type == "newMerchant";
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            LoginWithGoogleAppleFacebook(type: type),
            SizedBox(
              height: context.isSmallDevice
                  ? context.screenHeight * .038
                  : context.screenHeight * .06,
            ),
            SizedBox(height: 10.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Container(
                    width: context.isPortrait ? context.screenWidth : 410,
                    padding: isNewMerchant
                        ? EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 17.h)
                        : EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary.withValues(alpha: .2),
                        width: 2,
                      ),
                    ),
                    child: child,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: const Offset(0, -12), // move up 12px
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: OrUseCredentials(type: type),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
