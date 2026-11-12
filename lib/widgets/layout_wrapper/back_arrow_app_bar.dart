import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class BackArrowAppBar extends StatelessWidget {
  const BackArrowAppBar({super.key});

  // @override
  // Size get preferredSize => const Size.fromHeight(45);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      toolbarHeight:
          context.screenHeight *
          ScreenHeightsByPercentage.backArrowHeightAppbar,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: theme.colorScheme.primary,
          size: 20,
        ),
      ),
      backgroundColor: theme.colorScheme.onPrimary,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }
}
