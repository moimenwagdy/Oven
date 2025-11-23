import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class AboutPageSectionHeader extends StatelessWidget {
  final String headerText;
  const AboutPageSectionHeader({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: context.isDarkMode ? .2 : .1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(headerText, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
