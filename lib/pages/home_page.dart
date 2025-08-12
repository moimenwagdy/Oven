import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/widgets/home_page_widgets/navigate_to_auth_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "lib/assets/dessert-table.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 320),
                      child: Image.asset(
                        "lib/assets/logo_larg.png",
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 180.h),
                Center(child: NavigateToAuthButtons()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
