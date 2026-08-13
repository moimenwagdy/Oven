import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/myself_request%20_link_provider/myself_request_link_provider.dart';
import 'package:share_plus/share_plus.dart';

class MyselfFormLinkSuccessView extends ConsumerWidget {
  final String link;

  const MyselfFormLinkSuccessView({super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Share this link with whom will be the branch manager.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 16),
          SelectableText(link, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.share),
            label: const Text('Share Link'),
            onPressed: () => Share.share(link),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              ref.invalidate(submitMyselfFormProvider);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
