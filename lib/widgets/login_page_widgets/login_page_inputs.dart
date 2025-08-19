import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.email, style: Theme.of(context).textTheme.labelLarge),
        SizedBox(height: 10),
        CustomTextField(
          validator: Validators.validateEmail,
          controller: emailController,
          name: context.l10n.enterEmail,
          prefixIcon: Icons.email_outlined,
          inputType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.words,
        ),
        Text(
          context.l10n.password,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: 10),
        CustomTextField(
          validator: Validators.validatePassword,
          controller: passwordController,
          name: context.l10n.enterPassword,
          prefixIcon: Icons.lock,
          inputType: TextInputType.text,
          obscureText: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              child: Text(
                context.l10n.forgotPassword,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: onPrimary),
              ),
              onTap: () => {print("f")},
            ),
          ],
        ),
      ],
    );
  }
}
