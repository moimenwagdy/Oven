import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class SkipLandingPage extends StatelessWidget {
  const SkipLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            child: Text(
              context.l10n.skipToProducts,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: () => context.go("/home"),
          ),
        ],
      ),
    );
  }
}
