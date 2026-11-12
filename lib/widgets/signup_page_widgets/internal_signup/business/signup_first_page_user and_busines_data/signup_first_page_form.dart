import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/business/signup_first_page_user%20and_busines_data/signup_first_page_inputs.dart';

class SignupFirstPageForm extends ConsumerStatefulWidget {
  const SignupFirstPageForm({super.key});

  @override
  ConsumerState<SignupFirstPageForm> createState() =>
      _SignupFirstPageFormState();
}

class _SignupFirstPageFormState extends ConsumerState<SignupFirstPageForm> {
  final _formKey = GlobalKey<FormState>();

  void _onPress() {
    if (!_formKey.currentState!.validate()) return;
    context.push("/signup/165165/map");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SignupFirstPageInputs(),
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
              onPressed: _onPress,
            ),
          ),
        ],
      ),
    );
  }
}
