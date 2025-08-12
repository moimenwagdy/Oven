import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/widgets/home_page_widgets/navigate_to_auth_button.dart';

class NavigateToAuthButtons extends StatelessWidget {
  const NavigateToAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavigateToAuthButton(child: "Login", destination: "/login"),
          SizedBox(height: 30.h),
          NavigateToAuthButton(child: "Signup", destination: "/signup"),
        ],
      ),
    );
  }
}
