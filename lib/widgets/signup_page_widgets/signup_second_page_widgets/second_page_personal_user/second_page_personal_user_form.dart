import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
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
  String? _selectedArea;

  @override
  Widget build(BuildContext context) {
    void onPress() async {
      if (_formKey.currentState!.validate()) {
        _selectedArea;
      } else {
        return null;
      }
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(12),

          //   border: Border.all(
          //     color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
          //     width: 2,
          //   ),
          // ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SecondPagePersonalUserInputs(
                  adress: _address,
                  phoneNumber: _phoneNumber,
                  userName: _userName,
                  onSaved: (area) => _selectedArea = area,
                ),
                SizedBox(height: 20.h),
                FormSubmitButtom(
                  textChild: Text(
                    context.l10n.submit,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  onPressed: onPress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
