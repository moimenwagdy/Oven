import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/personal/personal_signup_first_page_widgets/peronal_signup_first_page_inputs.dart';

class PersonalSignupFirstPageForm extends StatelessWidget {
  const PersonalSignupFirstPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PeronalSignupFirstPageInputs(),
        SizedBox(
          width: 150,
          height: 50,
          child: FormSubmitButtom(
            onPressed: () {
              context.go("/personal/location");
            },
            textChild: Text(
              "Next",
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
