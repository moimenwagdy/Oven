import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      }
    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SignupFirstPageInputs(
            emailController: _emailController,
            passwordController: _passwordController,
            repeatpasswordController: _repeatpasswordController,
          ),
          FormSubmitButtom(
            textChild: Text(
              "Continue",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }
}
