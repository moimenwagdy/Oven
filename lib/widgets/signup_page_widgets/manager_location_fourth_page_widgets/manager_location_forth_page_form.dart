import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/signup_providers/manager_location_provider/manager_location_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/custom_widgets/oven_logo.dart';
import 'package:oven/widgets/custom_widgets/welcome_header_message.dart';
import 'package:oven/widgets/signup_page_widgets/manager_location_fourth_page_widgets/manager_location_forth_page_inputs.dart';

class ManagerLocationForthPageForm extends ConsumerStatefulWidget {
  const ManagerLocationForthPageForm({super.key});
  @override
  ConsumerState<ManagerLocationForthPageForm> createState() =>
      _ManagerLocationForthPageFormState();
}

class _ManagerLocationForthPageFormState
    extends ConsumerState<ManagerLocationForthPageForm> {
  final _formKey = GlobalKey<FormState>();
  void onPress() async {
    if (!_formKey.currentState!.validate()) return;
    final success = await ref.read(managerLocationProvider.notifier).submit();
    if (!success) {
      print("oppps");
      return;
    }
    context.go('/home');
  }

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
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: ManagerLocationForthPageInputs(),
                      ),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: FormSubmitButtom(
                          textChild: Text(
                            context.l10n.finishButton,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          onPressed: onPress,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
