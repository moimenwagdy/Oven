// For AsyncValue / AsyncData (or use package:riverpod/riverpod.dart).
import 'package:oven/models/address_info.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/models/devlivery_address_option.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
import 'package:oven/providers/where_to_devliver_provider/where_to_deliver_provider.dart';
// Adjust this import if AddressInfo is defined elsewhere in your project.
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'delivery_options_provider.g.dart';

String _formatAddress(AddressInfo a) {
  final line = [
    if (a.building.isNotEmpty) a.building,
    if (a.street.isNotEmpty) a.street,
    if (a.area.isNotEmpty) a.area,
    if (a.city.isNotEmpty) a.city,
  ].join(', ');
  final extra = [
    if (a.floor.isNotEmpty) 'Floor ${a.floor}',
    if (a.flat.isNotEmpty) 'Flat ${a.flat}',
  ].join(', ');
  final withExtra = extra.isEmpty ? line : '$line ($extra)';
  return a.details.isNotEmpty ? '$withExtra — ${a.details}' : withExtra;
}

/// "Home: 12 Street, ..." when the address has a label, otherwise just the address.
String _withLabel(AddressInfo a) {
  final text = _formatAddress(a);
  return a.label.isEmpty ? text : '${a.label}: $text';
}

/// Every address the current user can deliver to.
/// - No session: empty.
/// - Personal user: their own address ('personal').
/// - Manager: the accessible branches ('branch:<id>', main branch first),
///   then the manager's personal location ('owner') if it was set.
/// A manager sees loading/error until the branches arrive.
@riverpod
AsyncValue<List<DeliveryAddressOption>> deliveryOptions(Ref ref) {
  final session = ref.watch(currentSessionProvider);

  switch (session) {
    case null:
      return const AsyncData<List<DeliveryAddressOption>>([]);

    case PersonalSession(:final address):
      final text = _formatAddress(address);
      return AsyncData([
        if (text.trim().isNotEmpty)
          DeliveryAddressOption(id: 'personal', label: _withLabel(address)),
      ]);

    case ManagerSession(:final personalLocation):
      return ref.watch(accessibleBranchesProvider).whenData((branches) {
        return [
          for (final b in branches)
            DeliveryAddressOption(id: 'branch:${b.id}', label: b.name),
          if (personalLocation != null)
            DeliveryAddressOption(
              id: 'owner',
              label: _withLabel(personalLocation.address),
            ),
        ];
      });
  }
}

/// The option in effect: the user's pick if it still exists, otherwise
/// the first option. Null when there is nothing to pick yet.
/// This replaces the `effectiveId` logic that was duplicated in the widget.
@riverpod
DeliveryAddressOption? effectiveDeliveryOption(Ref ref) {
  final options = ref.watch(deliveryOptionsProvider).value;
  if (options == null || options.isEmpty) return null;

  final selectedId = ref.watch(radioListProvider);
  return options.where((o) => o.id == selectedId).firstOrNull ?? options.first;
}
