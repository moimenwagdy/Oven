import 'package:flutter/material.dart';

class ProfileDataErrorMessage extends StatelessWidget {
  final String errorMessage;
  const ProfileDataErrorMessage({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
