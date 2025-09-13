import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/frame_around_forms_with_text_between_tops.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';
import 'package:oven/widgets/custom%20widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/custom%20widgets/auth_welcome_header_message.dart';
import 'package:oven/widgets/signup_page_widgets/signup_first_page_widgets/signup_first_page_form.dart';

class SignupFirstPage extends StatelessWidget {
  final String type;
  const SignupFirstPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final bool isNewMerchant = type == "newMerchant";

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
                    AuthWelcomeHeaderMessage(
                      mainMessage: isNewMerchant
                          ? context.l10n.signinWelcomeMainMessage
                          : context.l10n.signupWelcomeMainMessage,
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
            isNewMerchant
                ? FrameAroundFormsWithTextBetweenTops(
                    type: type,
                    child: SignupFirstPageForm(type: type),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: SignupFirstPageForm(type: type),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
