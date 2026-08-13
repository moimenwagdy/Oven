import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_new_trademark_inputs.dart';

class SecondPageNewMerchantForm extends ConsumerStatefulWidget {
  final String? paylaod;
  const SecondPageNewMerchantForm({super.key, this.paylaod});

  @override
  ConsumerState<SecondPageNewMerchantForm> createState() =>
      _SecondPageNewMerchantFormState();
}

class _SecondPageNewMerchantFormState
    extends ConsumerState<SecondPageNewMerchantForm> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _onSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final ok = await ref.read(signupFormProvider.notifier).submit();

    if (ok && mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SecondPageNewMerchantInputs(),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 220,
                      height: 50,
                      child: FormSubmitButtom(
                        textChild: Text(
                          context.l10n.submit,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        onPressed: () => _onSubmit(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
