import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/signup_first_page_widgets/signup_first_page_inputs.dart';

class SignupFirstPageForm extends StatefulWidget {
  const SignupFirstPageForm({super.key, required this.type});
  final String type;
  @override
  State<SignupFirstPageForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupFirstPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void onPress() async {
      if (_formKey.currentState!.validate()) {
        context.push("/signup/${widget.type}/more");
      } else {
        return null;
        // context.push("/signup/${widget.type}/more");
      }
    }

    return
    //  Container(
    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(12),
    //   border: Border.all(
    //     color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
    //     width: 2,
    //   ),
    // ),
    // child:
    Form(
      key: _formKey,
      child: Column(
        children: [
          SignupFirstPageInputs(
            emailController: _emailController,
            passwordController: _passwordController,
            repeatpasswordController: _repeatpasswordController,
          ),
          SizedBox(height: 20.h),
          FormSubmitButtom(
            textChild: Text(
              context.l10n.countinue,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onPressed: onPress,
          ),
        ],
      ),
    );
    // );
  }
}
