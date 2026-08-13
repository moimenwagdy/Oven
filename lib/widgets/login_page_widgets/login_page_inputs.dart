import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';

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
      children: [
        CustomSignupLoginInputAndLabel(
          controller: emailController,
          label: context.l10n.email,
          placeholder: context.l10n.enterEmail,
          type: TextInputType.emailAddress,
          validator: (p0) {
            return (p0 == null || p0.isEmpty || !p0.contains("@"))
                ? "Invalid email"
                : null;
          },
        ),
        CustomSignupLoginInputAndLabel(
          controller: passwordController,
          label: context.l10n.password,
          placeholder: context.l10n.enterPassword,
          type: TextInputType.visiblePassword,
          validator: (p0) {
            return (p0 == null || p0.isEmpty) ? "Invalid password" : null;
          },
          obscureText: true,
        ),
      ],
    );
  }
}
