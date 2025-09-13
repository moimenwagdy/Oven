import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_new_merchant/second_page_new_merchant_inputs.dart';

class SecondPageNewMerchantForm extends StatefulWidget {
  const SecondPageNewMerchantForm({super.key});

  @override
  State<SecondPageNewMerchantForm> createState() =>
      _SecondPageNewMerchantFormState();
}

class _SecondPageNewMerchantFormState extends State<SecondPageNewMerchantForm> {
  final _formKey = GlobalKey<FormState>();

  final merchatName = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final userName = TextEditingController();
  final province = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SecondPageNewMerchantInputs(
                  merchantName: merchatName,
                  address: address,
                  userName: userName,
                  phoneNumber: phoneNumber,
                  province: province,
                ),
                SizedBox(height: 20.h),
                FormSubmitButtom(
                  textChild: Text(
                    context.l10n.submit,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
