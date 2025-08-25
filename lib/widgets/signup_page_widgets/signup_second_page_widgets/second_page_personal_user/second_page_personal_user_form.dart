import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_personal_user/second_page_personal_user_inputs.dart';

class SecondPagePersonalUserForm extends StatefulWidget {
  const SecondPagePersonalUserForm({super.key});

  @override
  State<SecondPagePersonalUserForm> createState() =>
      _SignupSecondPageFormState();
}

class _SignupSecondPageFormState extends State<SecondPagePersonalUserForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumber = TextEditingController();
  final _userName = TextEditingController();
  final _address = TextEditingController();
  final _otherInformations = TextEditingController();
  String? _selectedArea;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 3.h,
            children: [
              SecondPagePersonalUserInputs(
                adress: _address,
                otherInformation: _otherInformations,
                phoneNumber: _phoneNumber,
                userName: _userName,
                onSaved: (area) => _selectedArea = area,
              ),
              FormSubmitButtom(
                textChild: Text(
                  "Submit",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                onPressed: () {
                  _formKey.currentState!.save();
                  print(
                    "$_selectedArea ${_address.value.text} ${_phoneNumber.value.text} ${_userName.value.text} ",
                  ); // works!
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
