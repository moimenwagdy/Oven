import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';
import 'package:oven/widgets/login_page_widgets/forgot_password_button.dart';
import 'package:oven/widgets/login_page_widgets/login_page_inputs.dart';

class LoginPageForm extends ConsumerStatefulWidget {
  const LoginPageForm({super.key});

  @override
  ConsumerState<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends ConsumerState<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isloading = false;
  bool isSuccess = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onPress() async {
    final notifier = ref.read(fakeAuthProvider.notifier);
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      isloading = true;
    });

    await Future.delayed(Duration(milliseconds: 500));
    final signinSuccess = await notifier.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (signinSuccess == true) {
      _emailController.clear();
      _passwordController.clear();
      context.go("/home");
    } else {
      setState(() {
        isSuccess = false;
      });
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LoginPageInputs(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          SizedBox(height: 10),
          SizedBox(
            width: context.isPortrait ? context.screenWidth : 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ForgotPasswordButton()],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 220,
            height: 50,
            child: FormSubmitButtom(
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
          ),
          SizedBox(height: 10.h),
          SizedBox(
            // height: 10.h,
            child: isSuccess
                ? null
                : Text(
                    "Invalid email or password",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
