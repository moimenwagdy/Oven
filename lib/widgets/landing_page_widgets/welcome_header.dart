import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeHedaer extends StatelessWidget {
  const WelcomeHedaer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome To Oven",
      style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
    );
  }
}
