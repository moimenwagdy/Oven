import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';
import 'package:oven/widgets/login_page_widgets/auth_welcome_header_message.dart';
import 'package:oven/widgets/login_page_widgets/dont_have_Account_button.dart';
import 'package:oven/widgets/login_page_widgets/login_page_form.dart';
import 'package:oven/widgets/login_page_widgets/login_with_google_apple_facebook.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: onSurface,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: onSurface,
            automaticallyImplyLeading: false,
            title: null,
            actions: [],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: screenHeight * .90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                  color: onSecondary,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthWelcomeHeaderMessage(),
                      SizedBox(height: 20),
                      OvenLogo(maxW: 130),
                      SizedBox(height: 20),
                      LoginPageForm(),
                      SizedBox(height: 12),
                      LoginWithGoogleAppleFacebook(),
                      DontHaveAccountButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
