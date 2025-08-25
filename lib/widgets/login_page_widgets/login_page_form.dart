import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom%20widgets/spinner.dart';
import 'package:oven/widgets/login_page_widgets/login_page_inputs.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({super.key});

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isloading = false;
  void onPress() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      setState(() {
        isloading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        isloading = false;
      });
      print("Email: $email");
      print("Password: $password");
      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            offset: const Offset(3, 6),
            blurStyle: BlurStyle.outer,
            spreadRadius: 14,
            blurRadius: 1,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            LoginPageInputs(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Text(
                    context.l10n.forgotPassword,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  onTap: () => {print("f")},
                ),
              ],
            ),
            SizedBox(height: 15.h),
            FormSubmitButtom(
              textChild: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isloading ? context.l10n.loading : context.l10n.login,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  if (isloading) const SizedBox(width: 8),
                  if (isloading) const SmallSpinner(),
                ],
              ),
              onPressed: onPress,
            ),
          ],
        ),
      ),
    );
  }
}
