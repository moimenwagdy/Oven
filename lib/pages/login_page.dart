import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/frame_around_forms_with_text_between_tops.dart';
import 'package:oven/widgets/custom_widgets/oven_logo.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/custom_widgets/welcome_header_message.dart';
import 'package:oven/widgets/login_page_widgets/dont_have_account.dart';
import 'package:oven/widgets/login_page_widgets/login_page_form.dart';

class LoginPage extends StatelessWidget {
  final String type;
  const LoginPage({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    final isPersonal = type == "personal";
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
                      mainMessage: context.l10n.signinWelcomeMainMessage,
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
              onAppleTap: () {},
              onFacebookTap: () {},
              onGoogleTap: () {},
              type: type,
              child: Column(
                children: [
                  LoginPageForm(),
                  if (isPersonal)
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: DontHaveAccount(type: type),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
