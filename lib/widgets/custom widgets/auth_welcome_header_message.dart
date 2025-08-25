import 'package:flutter/material.dart';

class AuthWelcomeHeaderMessage extends StatelessWidget {
  const AuthWelcomeHeaderMessage({
    super.key,
    required this.mainMessage,
    required this.secondaryMessage,
  });
  final String mainMessage;
  final String secondaryMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: [
        Text(mainMessage, style: Theme.of(context).textTheme.displayLarge),
        Opacity(
          opacity: .5,
          child: Text(
            secondaryMessage,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(wordSpacing: 1),
          ),
        ),
      ],
    );
  }
}
