import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
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
      heightPercent: .95,
      childWidget: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 5.h,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            AuthWelcomeHeaderMessage(
              mainMessage: context.l10n.stepTwo,
              secondaryMessage: context.l10n.completeTheForm,
            ),
            OvenLogo(maxW: 120.h),
            child,
          ],
        ),
      ),
    );
  }
}
