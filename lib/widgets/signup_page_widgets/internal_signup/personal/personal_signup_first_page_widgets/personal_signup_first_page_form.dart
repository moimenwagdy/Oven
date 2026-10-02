import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/personal/personal_signup_first_page_widgets/peronal_signup_first_page_inputs.dart';

class PersonalSignupFirstPageForm extends StatefulWidget {
  const PersonalSignupFirstPageForm({super.key});

  @override
  State<PersonalSignupFirstPageForm> createState() =>
      _PersonalSignupFirstPageFormState();
}

class _PersonalSignupFirstPageFormState
    extends State<PersonalSignupFirstPageForm> {
  final _formKey = GlobalKey<FormState>();

  void onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    context.go("/personal/location");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PeronalSignupFirstPageInputs(),
          SizedBox(
            width: 150,
            height: 50,
            child: FormSubmitButtom(
              onPressed: onSubmit,
              textChild: Text(
                context.l10n.countinue,
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
