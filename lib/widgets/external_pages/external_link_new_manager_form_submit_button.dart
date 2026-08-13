import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class ExternalLinkFirstPageNewManagerFormSubmitButton extends StatelessWidget {
  const ExternalLinkFirstPageNewManagerFormSubmitButton({
    super.key,
    required this.formKey,
    required this.onClick,
  });
  final VoidCallback onClick;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: FormSubmitButtom(
        textChild: Text(
          "Submit",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        onPressed: onClick,
      ),
    );
  }
}
