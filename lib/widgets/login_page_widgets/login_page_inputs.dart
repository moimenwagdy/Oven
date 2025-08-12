import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors.dart';
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
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400.h),
      child: Column(
        children: [
          CustomTextField(
            validator: Validators.validateEmail,
            controller: emailController,
            name: "Email",
            prefixIcon: Icons.email_outlined,
            inputType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.words,
          ),
          CustomTextField(
            validator: Validators.validatePassword,
            controller: passwordController,
            name: "password",
            prefixIcon: Icons.password_outlined,
            inputType: TextInputType.text,
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Text(
                  "forgot password?",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: onPrimary),
                ),
                onTap: () => {print("f")},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
