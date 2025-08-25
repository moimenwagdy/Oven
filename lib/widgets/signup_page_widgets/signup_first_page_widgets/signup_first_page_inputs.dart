import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom%20widgets/custom_text_field.dart';

class SignupFirstPageInputs extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatpasswordController;
  const SignupFirstPageInputs({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.repeatpasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          spacing: 6.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.email,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              validator: Validators.validateEmail,
              controller: emailController,
              name: context.l10n.enterEmail,
              prefixIcon: Icons.mail,
              inputType: TextInputType.emailAddress,
            ),
          ],
        ),
        Column(
          spacing: 6.h,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              context.l10n.password,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              validator: Validators.validatePassword,
              controller: passwordController,
              name: context.l10n.enterPassword,
              prefixIcon: Icons.lock,
              inputType: TextInputType.text,
              obscureText: true,
            ),
          ],
        ),
        Column(
          spacing: 6.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.confirmPasswrod,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              validator: (value) => Validators.validateConfirmPassword(
                value,
                passwordController.value.text,
              ),
              controller: repeatpasswordController,
              name: context.l10n.repeatPasswrod,
              prefixIcon: Icons.lock,
              inputType: TextInputType.text,
              obscureText: true,
            ),
          ],
        ),
      ],
    );
  }
}
