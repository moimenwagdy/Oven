import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/requests/add_manager_request/add_manager_provider.dart';
import 'package:oven/widgets/custom_widgets/custom_dialog_alert.dart';
import 'package:share_plus/share_plus.dart';

class AddManagerShareLinkSuccessView extends ConsumerWidget {
  final String link;

  const AddManagerShareLinkSuccessView({super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SelectableText(
              link,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton.icon(
                  label: const Icon(Icons.share),
                  onPressed: () => Share.share(link),
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
          SizedBox(
            height: 30,
            child: ElevatedButton.icon(
              label: const Icon(Icons.delete),
              onPressed: () async {
                await customDialogAlert(
                  context: context,
                  onCancel: () {
                    context.pop(false);
                  },
                  onConfirm: () {
                    ref
                        .read(addManagerGeneratedLinksProvider.notifier)
                        .deleteGeneratedLink(link);
                    context.pop(false);
                  },
                  message: Text(
                    "You can't restore this link ,Are you sure you want to cancel adding new manager?",
                  ),
                  cancelationMessage: "Cancel",
                  confirmationMessage: "Confirm",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
