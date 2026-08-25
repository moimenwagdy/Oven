import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/custom_widgets/oven_logo.dart';
import 'package:oven/widgets/custom_widgets/welcome_header_message.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/business/signup_third_page_location_details/signup_third_page_location_details_form.dart';

class SignupThirdPage extends StatelessWidget {
  const SignupThirdPage({super.key});

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
                OvenLogo(
                  maxW: !context.isSmallDevice ? 240.h : 220.h,
                  minW: !context.isSmallDevice ? 200.h : 130.h,
                ),
                SizedBox(height: 20),
                WelcomeHeaderMessage(mainMessage: "Complete Details"),
              ],
            ),
            SizedBox(
              height: context.isSmallDevice
                  ? context.screenHeight * .038
                  : context.screenHeight * .06,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SignupThirdPageLocationDetailsForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
