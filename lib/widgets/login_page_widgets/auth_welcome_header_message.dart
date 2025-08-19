import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class AuthWelcomeHeaderMessage extends StatelessWidget {
  const AuthWelcomeHeaderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.welcomeMainMessage,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(height: 5),
        Opacity(
          opacity: .5,
          child: Text(
            context.l10n.welcomeSecondMessage,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(wordSpacing: 1),
          ),
        ),
      ],
    );
  }
}
