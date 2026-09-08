import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/signup_providers/personal_signup_provider/personal_signup_notifier.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/personal/personal_signup_second_page_widgets/personal_signup_second_page_inputs.dart';

class PersonalSignupSecondPageForm extends ConsumerStatefulWidget {
  const PersonalSignupSecondPageForm({super.key});

  @override
  ConsumerState<PersonalSignupSecondPageForm> createState() =>
      _PersonalSignupSecondPageFormState();
}

class _PersonalSignupSecondPageFormState
    extends ConsumerState<PersonalSignupSecondPageForm> {
  final _formKey = GlobalKey<FormState>();

  void onSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final success = await ref.read(personalSignupProvider.notifier).submit();
    if (success) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PersonalSignupSecondPageInputs(),
          SizedBox(
            width: 150,
            height: 50,
            child: FormSubmitButtom(
              onPressed: () => onSubmit(context),
              textChild: Text(
                "Submit",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: onPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
