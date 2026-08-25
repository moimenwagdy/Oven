import 'package:flutter/material.dart';
import 'package:oven/pages/signup_pages/internal_signup_pages/business/signup_second_page/signup_second_page.dart';

class ExternalSignupSecondPage extends StatelessWidget {
  final String? payload;
  const ExternalSignupSecondPage({super.key, this.payload});
  @override
  Widget build(BuildContext context) {
    return SignupSecondPage();
  }
}
