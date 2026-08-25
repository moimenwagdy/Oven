import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_notifier.dart';

import 'package:oven/widgets/custom_widgets/forms_custom_widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/business/signup_second_page_map_locaton/signup_second_page_map_location_form.dart';

class SignupSecondPage extends ConsumerWidget {
  const SignupSecondPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return WhiteBackgroundScreenRadiusedForLoginAndSignupForms(
      childWidget: SignupSecondPageMapLocationForm(
        onCameraMove: (p0) {
          print(
            "from full branch and manager form from both internal and external signup",
          );
          ref
              .read(signupProvider.notifier)
              .setLocation(latitude: p0.latitude, longitude: p0.longitude);
        },
      ),
    );
  }
}
