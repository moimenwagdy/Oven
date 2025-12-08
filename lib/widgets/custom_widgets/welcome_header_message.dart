import 'package:flutter/material.dart';

class WelcomeHeaderMessage extends StatelessWidget {
  const WelcomeHeaderMessage({super.key, required this.mainMessage});
  final String mainMessage;
  @override
  Widget build(BuildContext context) {
    return Text(mainMessage, style: Theme.of(context).textTheme.displayLarge);
  }
}
