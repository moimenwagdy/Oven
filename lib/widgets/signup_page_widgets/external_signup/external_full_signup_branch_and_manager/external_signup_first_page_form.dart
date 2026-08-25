import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/external_signup/external_full_signup_branch_and_manager/external_signup_first_page_inputs.dart';

class ExternalSignupFirstPageForm extends StatefulWidget {
  final String payload;
  const ExternalSignupFirstPageForm({super.key, required this.payload});

  @override
  State<ExternalSignupFirstPageForm> createState() =>
      _ExternalSignupFirstPageFormState();
}

class _ExternalSignupFirstPageFormState
    extends State<ExternalSignupFirstPageForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void onPress() async {
      if (_formKey.currentState!.validate()) {
        print("the rededirect should be to the second page");
        context.push("/external/${widget.payload}/map");
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          ExternalSignupFirstPageInputs(payload: widget.payload),
          SizedBox(height: 20.h),
          SizedBox(
            width: 220,
            height: 50,
            child: FormSubmitButtom(
              textChild: Text(
                "Next",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              onPressed: onPress,
            ),
          ),
        ],
      ),
    );
  }
}
