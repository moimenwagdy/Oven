import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/login_page_widgets/google_facebook_apple_icons/login_with_google_apple_facebook_icons_frame.dart';

class LoginWithGoogleAppleFacebookIcons extends StatelessWidget {
  final GestureTapCallback onAppleTap;
  final GestureTapCallback onFacebookTap;
  final GestureTapCallback onGoogleTap;

  const LoginWithGoogleAppleFacebookIcons({
    super.key,
    required this.onAppleTap,
    required this.onFacebookTap,
    required this.onGoogleTap,
  });

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
          onTap: onAppleTap,
        ),
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/facebook_logo.png",
          width: 35,
          onTap: onFacebookTap,
          brand: "Facebook",
        ),
        LoginWithGoogleAppleFacebookIconsFrame(
          imgSource: "lib/assets/google_logo.png",
          width: 32,
          brand: "Goolge",
          onTap: onGoogleTap,
        ),
      ],
    );
  }
}
