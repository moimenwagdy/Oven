import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/external_signup/external_manager_only_signup/external_new_manager_third_page_widgets/external_new_manager_third_page_inputs.dart';

class ExternalNewManagerThirdPageForm extends StatelessWidget {
  const ExternalNewManagerThirdPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExternalNewManagerThirdPageInputs(),
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
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
