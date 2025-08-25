import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class LoginWithGoogleAppleFacebook extends StatelessWidget {
  const LoginWithGoogleAppleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7,
      children: [
        Opacity(opacity: .5, child: Text(context.l10n.connectOptions)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Image.asset("lib/assets/facebook_logo.png", width: 50),
            Image.asset("lib/assets/google_logo.png", width: 50),
            Image.asset(
              "lib/assets/apple_logo.png",
              width: 50,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ],
    );
  }
}
