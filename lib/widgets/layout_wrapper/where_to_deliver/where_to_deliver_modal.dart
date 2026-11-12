import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/models/devlivery_address_option.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/where_to_devliver_provider/delivery_options_provider.dart';
import 'package:oven/providers/where_to_devliver_provider/where_to_deliver_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class WhereToDeliverModal extends ConsumerWidget {
  const WhereToDeliverModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(currentSessionProvider);

    if (session == null) {
      return GestureDetector(
        onTap: () {
          context.go('/login/login');
        },
        child: Text(
          context.l10n.whereToDeliver,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }

    final options =
        ref.watch(deliveryOptionsProvider).value ??
        const <DeliveryAddressOption>[];
    final selected = ref.watch(effectiveDeliveryOptionProvider);
    final valueToShow = selected?.label ?? context.l10n.whereToDeliver;

    return GestureDetector(
      onTap: options.isEmpty ? null : () => showTopSheet(context),
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

void showTopSheet(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    barrierColor: Colors.black.withValues(alpha: 0.3),
    transitionDuration: const Duration(milliseconds: 200),

    pageBuilder: (dialogContext, anim1, anim2) {
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: context.screenWidth * .9,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const BuildRadioList(),
            ),
          ),
        ),
      );
    },
  );
}

class BuildRadioList extends ConsumerWidget {
  const BuildRadioList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options =
        ref.watch(deliveryOptionsProvider).value ??
        const <DeliveryAddressOption>[];
    final effectiveId = ref.watch(effectiveDeliveryOptionProvider)?.id;
    final isPersonal = ref.watch(currentSessionProvider) is PersonalSession;
    final hasOwnerAddress = options.any((o) => o.id == 'owner');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...options.map((option) {
          final colon = option.label.indexOf(':');
          final shortcut = colon == -1
              ? option.label
              : option.label.substring(0, colon);
          return RadioMenuButton<String>(
            groupValue: effectiveId,
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              ),
            ),
            value: option.id,
            onChanged: (value) {
              if (value == null) return;
              ref.read(radioListProvider.notifier).selectAddress(value);
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: (context.screenWidth - 50) * .80,
              child: Wrap(
                children: [
                  Text(
                    shortcut,
                    style: Theme.of(context).textTheme.labelLarge,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          );
        }),
        if (!hasOwnerAddress && !isPersonal)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextButton.icon(
              onPressed: () {
                context.go('/managermap');
              },
              icon: const Icon(Icons.add_location_alt_outlined),
              label: Text(context.l10n.addPersonalAddress),
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
