import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/external_signup/external_manager_only_signup/external_manager_signup_first_page_widgets/external_manager_signup_inputs.dart';

class ExternalManagerSignupForm extends StatefulWidget {
  final String payload;
  const ExternalManagerSignupForm({super.key, required this.payload});

  @override
  State<ExternalManagerSignupForm> createState() =>
      _ExternalManagerSignupFormState();
}

class _ExternalManagerSignupFormState extends State<ExternalManagerSignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void onPress() async {
      if (!_formKey.currentState!.validate()) {
        print("the rededirect should be to the second page");
        context.push("/external/${widget.payload}/managermap");
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          ExternalManagerSignupInputs(),
          SizedBox(height: 20.h),
          SizedBox(
            width: 220,
            height: 50,
            child: FormSubmitButtom(
              textChild: Text(
                context.l10n.countinue,

                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              onPressed: onPress,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Submitting this form will confirm you as a manager for ${widget.payload} Branch ",
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
