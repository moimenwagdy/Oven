import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';
import 'package:oven/widgets/custom%20widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/custom%20widgets/auth_welcome_header_message.dart';
import 'package:oven/widgets/signup_page_widgets/signup_first_page_widgets/signup_first_page_form.dart';

class SignupFirstPage extends StatelessWidget {
  final String type;
  const SignupFirstPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return WhiteBackgroundScreenRadiusedForLoginAndSignupForms(
      heightPercent: .92,
      childWidget: Padding(
        padding: const EdgeInsets.only(
          right: 30,
          left: 30,
          top: 30,
          bottom: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 5.h,
          children: [
            AuthWelcomeHeaderMessage(
              mainMessage: context.l10n.signupWelcomeMainMessage,
              secondaryMessage: context.l10n.signupWelcomeSecondMessage,
            ),
            OvenLogo(maxW: 130),
            SignupFirstPageForm(type: type),
          ],
        ),
      ),
    );
  }
}
