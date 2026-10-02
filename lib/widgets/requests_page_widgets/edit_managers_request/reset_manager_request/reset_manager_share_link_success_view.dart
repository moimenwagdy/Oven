import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:share_plus/share_plus.dart';

class ResetManagerShareLinkSuccessView extends ConsumerWidget {
  final String link;

  const ResetManagerShareLinkSuccessView({super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(link, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.share),
            label: Text(context.l10n.shareLink),
            onPressed: () => Share.share(link),
          ),
        ],
      ),
    );
  }
}
