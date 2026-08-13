import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/frame_around_forms_with_text_between_tops.dart';
import 'package:oven/widgets/custom_widgets/oven_logo.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/custom_widgets/welcome_header_message.dart';
import 'package:oven/widgets/signup_page_widgets/external_signup_first_page_widgets/external_signup_first_page_form.dart';

class ExternalSignupFirstPage extends StatelessWidget {
  final String payload;
  const ExternalSignupFirstPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    return WhiteBackgroundScreenRadiusedForLoginAndSignupForms(
      childWidget: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isSmallDevice ? 15 : 25,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    OvenLogo(
                      maxW: !context.isSmallDevice ? 240.h : 220.h,
                      minW: !context.isSmallDevice ? 200.h : 130.h,
                    ),
                    SizedBox(height: 10),
                    WelcomeHeaderMessage(
                      mainMessage: context.l10n.signupWelcomeMainMessage,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.isSmallDevice
                  ? context.screenHeight * .038
                  : context.screenHeight * .06,
            ),
            FrameAroundFormsWithTextBetweenTops(
              type: "",
              child: ExternalSignupFirstPageForm(payload: payload),
              onAppleTap: () {},
              onFacebookTap: () {},
              onGoogleTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
