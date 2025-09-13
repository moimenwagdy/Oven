import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom%20widgets/custom_text_field.dart';

class LoginPageInputs extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginPageInputs({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.email,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              validator: Validators.validateEmail,
              controller: emailController,
              name: context.l10n.enterEmail,
              inputType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.words,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.password,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              validator: Validators.validatePassword,
              controller: passwordController,
              name: context.l10n.enterPassword,
              inputType: TextInputType.text,
              obscureText: true,
            ),
          ],
        ),
      ],
    );
  }
}
