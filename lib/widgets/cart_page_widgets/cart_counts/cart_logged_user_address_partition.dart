import 'package:flutter/material.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/user_ui_data_account_and_address/extract_user_addresses.dart';
import 'package:oven/widgets/layout_wrapper/where_to_deliver/where_to_deliver_modal.dart';

class CartLoggedUserAddressPartition extends StatelessWidget {
  final FakeUser loggedUser;
  const CartLoggedUserAddressPartition({super.key, required this.loggedUser});

  @override
  Widget build(BuildContext context) {
    // No session yet (guest browsing, or session still resolving) —
    // don't crash, just don't offer address selection.

    final options = extractUserAddresses(loggedUser);

    return switch (loggedUser) {
      PersonalFakeUser(:final address) => Text(address.details),
      BusinessFakeUser(:final address) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_pin,
              color: Theme.of(context).colorScheme.primary,
              size: 18,
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                "${address.city}, ${address.area}, ${address.street}, Building ${address.building}, floor ${address.floor}, ${address.flat}, ${address.details}",
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => showTopSheet(context, options),
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
      ),
    };
  }
}
