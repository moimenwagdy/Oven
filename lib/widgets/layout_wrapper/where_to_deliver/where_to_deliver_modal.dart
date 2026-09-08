import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/where_to_devliver_provider/where_to_deliver_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/utils/helpers/user_ui_data_account_and_address/extract_user_addresses.dart';

class WhereToDeliverModal extends ConsumerWidget {
  const WhereToDeliverModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fakeAuthProvider).value;

    if (user == null) {
      return Text(
        context.l10n.whereToDeliver,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      );
    }

    final options = extractUserAddresses(user);
    final selectedId = ref.watch(radioListProvider);

    // Default to the branch address when nothing has been explicitly
    // selected yet, instead of showing the placeholder while a valid
    // address already exists.
    final effectiveId =
        selectedId ?? (options.any((o) => o.id == 'branch') ? 'branch' : null);

    final selectedLabel = options
        .where((o) => o.id == effectiveId)
        .map((o) => o.label)
        .firstOrNull;

    final valueToShow = selectedLabel ?? context.l10n.whereToDeliver;

    return GestureDetector(
      onTap: options.isEmpty ? null : () => showTopSheet(context, options),
      child: Text(
        limitedTextWords(valueToShow, 4),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          shadows: [
            Shadow(
              offset: const Offset(1, 1),
              blurRadius: 6,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
      ),
    );
  }
}

void showTopSheet(BuildContext context, List<DeliveryAddressOption> options) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    barrierColor: Colors.black.withValues(alpha: 0.3),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(top: 130),
            width: context.screenWidth * .9,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: BuildRadioList(options: options),
          ),
        ),
      );
    },
  );
}

class BuildRadioList extends ConsumerWidget {
  final List<DeliveryAddressOption> options;

  const BuildRadioList({super.key, required this.options});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(radioListProvider);
    final effectiveId =
        selectedId ?? (options.any((o) => o.id == 'branch') ? 'branch' : null);

    final hasOwnerAddress = options.any((o) => o.id == 'owner');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...options.map((option) {
          return RadioMenuButton<String>(
            groupValue: effectiveId,
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              ),
            ),
            value: option.id,
            onChanged: (value) {
              ref.read(radioListProvider.notifier).selectAddress(value!);
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: (context.screenWidth - 50) * .80,
              child: Wrap(
                children: [
                  Text(
                    option.label,
                    style: Theme.of(context).textTheme.labelSmall,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          );
        }),
        if (!hasOwnerAddress)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextButton.icon(
              onPressed: () {
                context.go('/managermap');
              },
              icon: const Icon(Icons.add_location_alt_outlined),
              label: const Text('Add your address'),
            ),
          ),
      ],
    );
  }
}

String limitedTextWords(String text, int limit) {
  final words = text.trim().split(RegExp(r"\s+"));
  if (words.length <= limit) return text;
  return "${words.take(limit).join(' ')}...";
}
