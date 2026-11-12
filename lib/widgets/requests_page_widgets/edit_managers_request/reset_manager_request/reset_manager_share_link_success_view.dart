import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/requests/reset_manager_request/reset_manager_provider.dart';
import 'package:share_plus/share_plus.dart';

class ResetManagerShareLinkSuccessView extends ConsumerWidget {
  final String link;
  final String managerID;

  const ResetManagerShareLinkSuccessView({
    super.key,
    required this.link,
    required this.managerID,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: SelectableText(
              link,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Row(
            spacing: 5,
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  child: Icon(Icons.share, size: 15),
                  onPressed: () => Share.share(link),
                ),
              ),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  child: Icon(Icons.undo, size: 15),
                  onPressed: () => ref
                      .read(resetManagersProvider.notifier)
                      .removeManagerFromResetState(managerID),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
