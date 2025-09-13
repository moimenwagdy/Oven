import 'package:flutter/material.dart';

class AuthWelcomeHeaderMessage extends StatelessWidget {
  const AuthWelcomeHeaderMessage({super.key, required this.mainMessage});
  final String mainMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: [
        Text(mainMessage, style: Theme.of(context).textTheme.displayLarge),
      ],
    );
  }
}
