import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/login_page_widgets/google_facebook_apple_icons/login_with_google_apple_facebook_icons_frame.dart';

class LoginWithGoogleAppleFacebookIcons extends StatelessWidget {
  const LoginWithGoogleAppleFacebookIcons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/apple_logo.png",
          width: 28,
          brand: "Apple",
          iconColor: context.isDarkMode ? Colors.white : null,
        ),
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/facebook_logo.png",
          width: 35,
          brand: "Facebook",
        ),
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/google_logo.png",
          width: 32,
          brand: "Goolge",
        ),
      ],
    );
  }
}
