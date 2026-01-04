import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/pop_provider/pop_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class SkipLandingPage extends ConsumerWidget {
  const SkipLandingPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        context.go("/home");
        ref.read(navigationIndexProvider.notifier).setNavigationIndex(0);
      },
      child: SizedBox(
        height: 35,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              context.l10n.skipToProducts,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
