import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/signup_providers/external_signup_manager_form_state_provider/exernal_manager_signup_notifier.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/business/signup_second_page_map_locaton/signup_second_page_map_location_form.dart';

class ExternalNewManagerSecondPage extends ConsumerWidget {
  const ExternalNewManagerSecondPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return WhiteBackgroundScreenRadiusedForLoginAndSignupForms(
      childWidget: SignupSecondPageMapLocationForm(
        onCameraMove: (p0) {
          print("from manager only externalsignup");
          ref
              .read(externalManagerSignupProvider.notifier)
              .setLocation(latitude: p0.latitude, longitude: p0.longitude);
        },
      ),
    );
  }
}
