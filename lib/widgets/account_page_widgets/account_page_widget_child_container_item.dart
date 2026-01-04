import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class AccountPageWidgetChildContainerItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final String? title;

  const AccountPageWidgetChildContainerItem({
    super.key,
    required this.icon,
    this.onTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        height: context.isSmallDevice ? 50 : 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withValues(
            alpha: context.isDarkMode ? .15 : .05,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 20,
              children: [
                Icon(
                  icon,
                  size: context.isSmallDevice ? 15 : 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: context.isSmallDevice ? 14 : 16,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: context.isSmallDevice ? 15 : 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
