import 'package:flutter/material.dart';

class RequestsPageHeader extends StatelessWidget {
  final String title;
  final String secondrayTitle;
  const RequestsPageHeader({
    super.key,
    required this.title,
    this.secondrayTitle = "",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(fontSize: 17),
              ),
              Text(
                secondrayTitle,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        Container(height: 2, color: theme.colorScheme.primary),
      ],
    );
  }
}
