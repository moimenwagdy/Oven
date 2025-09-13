import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/auth_welcome_header_message.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';
import 'package:oven/widgets/custom%20widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_current_merchant/second_page_current_merchant_form.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_new_merchant/second_page_new_merchant_form.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_personal_user/second_page_personal_user_form.dart';

class SignupSecondPage extends StatelessWidget {
  final String type;
  const SignupSecondPage({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (type) {
      case "personal":
        child = SecondPagePersonalUserForm();
        break;
      case "newMerchant":
        child = SecondPageNewMerchantForm();
        break;
      case "currentMerchant":
        child = SecondPageCurrentMerchantForm();
        break;
      default:
        child = const Text("Unknown signup type");
    }

    return WhiteBackgroundScreenRadiusedForLoginAndSignupForms(
      childWidget: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isSmallDevice ? 15 : 25,
          horizontal: 20,
        ),
        child: Column(
          children: [
            OvenLogo(
              maxW: !context.isSmallDevice ? 240.h : 220.h,
              minW: !context.isSmallDevice ? 200.h : 130.h,
            ),
            SizedBox(height: 10),
            AuthWelcomeHeaderMessage(mainMessage: context.l10n.stepTwo),
            SizedBox(
              height: context.isSmallDevice
                  ? context.screenHeight * .038
                  : context.screenHeight * .06,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
