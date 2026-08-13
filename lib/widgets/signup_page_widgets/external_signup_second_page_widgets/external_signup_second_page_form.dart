import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/external_signup_second_page_widgets/external_signup_second_page_inputs.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_new_trademark_inputs.dart';

class ExternalSignupSecondPagNewMerchantForm extends StatefulWidget {
  final String? paylaod;
  const ExternalSignupSecondPagNewMerchantForm({super.key, this.paylaod});

  @override
  State<ExternalSignupSecondPagNewMerchantForm> createState() =>
      _ExternalSignupSecondPagNewMerchantFormState();
}

class _ExternalSignupSecondPagNewMerchantFormState
    extends State<ExternalSignupSecondPagNewMerchantForm> {
  final _formKey = GlobalKey<FormState>();

  final branchNameController = TextEditingController();
  final provinceController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  late TextEditingController trademarkNameController;

  @override
  void initState() {
    if (widget.paylaod != null) {
      trademarkNameController = TextEditingController(
        text: "Trademarkname from response",
      );
    } else {
      trademarkNameController = TextEditingController(text: "");
    }

    super.initState();
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
                    ExternalSignupSecondPageInputs(
                      trademarkNameController: trademarkNameController,
                      branchNameController: branchNameController,
                      addressController: addressController,
                      locationController: locationController,
                      provinceController: provinceController,
                    ),
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
                        onPressed: () {},
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
