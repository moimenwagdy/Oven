import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/personal/personal_signup_second_page_widgets/personal_signup_second_page_inputs.dart';

class PersonalSignupSecondPageForm extends StatelessWidget {
  const PersonalSignupSecondPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalSignupSecondPageInputs(),
        SizedBox(
          width: 150,
          height: 50,
          child: FormSubmitButtom(
            onPressed: () {},
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
