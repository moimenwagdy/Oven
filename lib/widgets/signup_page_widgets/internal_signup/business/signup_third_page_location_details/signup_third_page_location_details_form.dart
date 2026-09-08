import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/signup_providers/bussines_signup_form_state_provider/signup_form_notifier.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/business/signup_third_page_location_details/signup_third_page_location_details_inputs.dart';

class SignupThirdPageLocationDetailsForm extends ConsumerStatefulWidget {
  const SignupThirdPageLocationDetailsForm({super.key});

  @override
  ConsumerState<SignupThirdPageLocationDetailsForm> createState() =>
      _SignupThirdPageLocationDetailsFormState();
}

class _SignupThirdPageLocationDetailsFormState
    extends ConsumerState<SignupThirdPageLocationDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  void _onPress(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final success = await ref.read(businessSignupProvider.notifier).submit();
    if (!success) {
      print("oppps");
      return;
    }
    context.go('/managermap');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SignupThirdPageLocationDetailsInputs(),
          SizedBox(
            width: 150,
            height: 50,
            child: FormSubmitButtom(
              textChild: Text(
                "Finish",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: onPrimary),
              ),
              onPressed: () => _onPress(context),
            ),
          ),
        ],
      ),
    );
  }
}
