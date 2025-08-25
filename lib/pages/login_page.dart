import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';
import 'package:oven/widgets/custom%20widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/custom%20widgets/auth_welcome_header_message.dart';
import 'package:oven/widgets/login_page_widgets/dont_have_Account_button.dart';
import 'package:oven/widgets/login_page_widgets/login_page_form.dart';
import 'package:oven/widgets/login_page_widgets/login_with_google_apple_facebook.dart';

class LoginPage extends StatelessWidget {
  final String type;
  const LoginPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return WhiteBackgroundScreenRadiusedForLoginAndSignupForms(
          heightPercent: .92,
          childWidget: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 5,
              children: [
                AuthWelcomeHeaderMessage(
                  mainMessage: context.l10n.signinWelcomeMainMessage,
                  secondaryMessage: context.l10n.signinWelcomeSecondMessage,
                ),
                OvenLogo(maxW: 130),
                LoginPageForm(),
                Column(
                  spacing: 10,
                  children: [
                    LoginWithGoogleAppleFacebook(),
                    DontHaveAccountButton(type: type),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
