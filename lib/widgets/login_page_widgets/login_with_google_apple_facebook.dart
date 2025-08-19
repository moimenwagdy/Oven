import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class LoginWithGoogleAppleFacebook extends StatelessWidget {
  const LoginWithGoogleAppleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(context.l10n.connectOptions),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 0,
          children: [
            Image.asset("lib/assets/facebook_logo.png", width: 40),
            Image.asset("lib/assets/google_logo.png", width: 80),
            Image.asset("lib/assets/apple_logo.png", width: 35),
          ],
        ),
      ],
    );
  }
}
