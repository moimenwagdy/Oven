import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_current_merchant/second_page_current_merchant_inputs.dart';

class SecondPageCurrentMerchantForm extends StatefulWidget {
  const SecondPageCurrentMerchantForm({super.key});

  @override
  State<SecondPageCurrentMerchantForm> createState() =>
      _SecondPageCurrentMerchantFormState();
}

class _SecondPageCurrentMerchantFormState
    extends State<SecondPageCurrentMerchantForm> {
  final _formKey = GlobalKey<FormState>();

  final _customerCode = TextEditingController();
  final _userName = TextEditingController();
  final _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 3.h,
        children: [
          SecondPageCurrentMerchantInputs(
            customerCode: _customerCode,
            phoneNumber: _phoneNumber,
            userName: _userName,
          ),
          FormSubmitButtom(
            textChild: Text(
              "Submit",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
