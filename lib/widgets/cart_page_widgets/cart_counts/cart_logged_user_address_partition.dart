import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/where_to_devliver_provider/delivery_options_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/layout_wrapper/where_to_deliver/where_to_deliver_modal.dart';

class CartLoggedUserAddressPartition extends ConsumerWidget {
  const CartLoggedUserAddressPartition({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(effectiveDeliveryOptionProvider);
    final isManager = ref.watch(
      currentSessionProvider.select((session) => session is ManagerSession),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_pin,
            color: Theme.of(context).colorScheme.primary,
            size: 18,
          ),
          const SizedBox(width: 5),
          // Null while a manager's branches are still loading.
          Expanded(child: Text(selected?.label ?? context.l10n.whereToDeliver)),
          const SizedBox(width: 10),
          if (isManager)
            GestureDetector(
              onTap: () => showTopSheet(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Text(
                  "Change",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
