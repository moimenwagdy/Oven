import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class AccountPageItem extends StatelessWidget {
  final String destination;
  final String title;
  final IconData icon;

  const AccountPageItem({
    super.key,
    required this.destination,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        minTileHeight: context.isSmallDevice ? 50 : 55,
        tileColor: Theme.of(context).colorScheme.onSurface.withValues(
          alpha: context.isDarkMode ? .15 : .05,
        ),
        focusColor: primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: context.isSmallDevice ? 14 : 16,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: context.isSmallDevice ? 0 : 2,
        ),
        iconColor: primary,
        title: Text(title),
        leading: Icon(icon, size: context.isSmallDevice ? 15 : 20),
        onTap: () => context.push(destination),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: context.isSmallDevice ? 15 : 20,
        ),
      ),
    );
  }
}
