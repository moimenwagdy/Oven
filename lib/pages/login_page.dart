import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oven/widgets/login_page_widgets/login_page_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                // Image.asset(
                //   "lib/assets/logo_larg.png",
                //   alignment: Alignment.bottomCenter,
                //   fit: BoxFit.contain,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          LoginPageForm(),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an acocunt?"),
                              GestureDetector(
                                onTap: () {
                                  print("object");
                                },
                                child: Text(
                                  " Sign Up",
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
