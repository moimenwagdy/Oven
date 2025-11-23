import 'package:flutter/material.dart';
import 'package:oven/widgets/login_page_widgets/google_facebook_apple_icons/login_with_google_apple_facebook_icons_frame.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/instagram.png",
          brand: "Instagram",
          width: 45,
        ),
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/twitter.png",
          brand: "x",
          width: 75,
        ),
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/facebook_logo.png",
          brand: "Facebook",
          width: 35,
        ),
      ],
    );
  }
}
