import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom%20widgets/spinner.dart';
import 'package:oven/widgets/login_page_widgets/forgot_password_button.dart';
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
      // final email = _emailController.text.trim();
      // final password = _passwordController.text.trim();
      setState(() {
        isloading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        isloading = false;
      });

      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Container(
        // padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
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
              LoginPageInputs(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ForgotPasswordButton()],
              ),
              SizedBox(height: 10.h),
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
      ],
    );
  }
}

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:oven/utils/helpers/localization_extension.dart';
// import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
// import 'package:oven/widgets/custom%20widgets/spinner.dart';
// import 'package:oven/widgets/login_page_widgets/forgot_password_button.dart';
// import 'package:oven/widgets/login_page_widgets/login_page_inputs.dart';

// class LoginPageForm extends StatefulWidget {
//   const LoginPageForm({super.key});

//   @override
//   State<LoginPageForm> createState() => _LoginPageFormState();
// }

// class _LoginPageFormState extends State<LoginPageForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool isloading = false;
//   void onPress() async {
//     if (_formKey.currentState!.validate()) {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();
//       setState(() {
//         isloading = true;
//       });
//       await Future.delayed(Duration(seconds: 2));
//       setState(() {
//         isloading = false;
//       });
//       print("Email: $email");
//       print("Password: $password");
//       _emailController.clear();
//       _passwordController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),

//         border: Border.all(
//           color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
//           width: 2,
//         ),
//       ),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             LoginPageInputs(
//               emailController: _emailController,
//               passwordController: _passwordController,
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [ForgotPasswordButton()],
//             ),
//             SizedBox(height: 15.h),
//             FormSubmitButtom(
//               textChild: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     isloading ? context.l10n.loading : context.l10n.login,
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.onSecondary,
//                     ),
//                   ),
//                   if (isloading) const SizedBox(width: 8),
//                   if (isloading) const SmallSpinner(),
//                 ],
//               ),
//               onPressed: onPress,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
