import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/signup_providers/bussines_signup_form_state_provider/signup_form_state_provider.dart';
import 'package:oven/providers/signup_providers/personal_signup_provider/personal_signup_state.dart';

/// One selectable delivery address, tagged with a stable id.
class DeliveryAddressOption {
  final String id; // 'branch' or 'owner' — stable across edits/rebuilds
  final String label; // formatted text for display

  const DeliveryAddressOption({required this.id, required this.label});
}

String _formatAddress(AddressInfo address, {String? city}) {
  final parts = [
    if (address.building.isNotEmpty) address.building,
    if (address.street.isNotEmpty) address.street,
    if (address.area.isNotEmpty) address.area,
    if (city != null && city.isNotEmpty) city,
  ];
  final line = parts.join(', ');
  final extra = [
    if (address.floor.isNotEmpty) 'Floor ${address.floor}',
    if (address.flat.isNotEmpty) 'Flat ${address.flat}',
  ].join(', ');
  final withExtra = extra.isEmpty ? line : '$line ($extra)';
  return address.details.isNotEmpty
      ? '$withExtra — ${address.details}'
      : withExtra;
}

String _formatPersonalAddress(PersonalAddressInfo address) {
  final parts = [
    if (address.building.isNotEmpty) address.building,
    if (address.street.isNotEmpty) address.street,
    if (address.area.isNotEmpty) address.area,
  ];
  final line = parts.join(', ');
  final extra = [
    if (address.floor.isNotEmpty) 'Floor ${address.floor}',
    if (address.flat.isNotEmpty) 'Flat ${address.flat}',
  ].join(', ');
  final withExtra = extra.isEmpty ? line : '$line ($extra)';
  return address.details.isNotEmpty
      ? '$withExtra — ${address.details}'
      : withExtra;
}

/// Returns this user's deliverable addresses as stable, id-tagged options.
/// - Personal users: a single 'branch'-id option holding their own address
///   (they have no branch/owner concept, but reusing the id keeps callers
///   from needing to special-case personal vs business).
/// - Business users: 'branch' always present; 'owner' only if that
///   optional post-signup step was completed.
/// Empty/unset addresses are omitted entirely.
List<DeliveryAddressOption> extractUserAddresses(FakeUser user) {
  return switch (user) {
    PersonalFakeUser(:final address) => [
      if (_formatPersonalAddress(address).trim().isNotEmpty)
        DeliveryAddressOption(
          id: 'branch',
          label: _formatPersonalAddress(address),
        ),
    ],
    BusinessFakeUser(:final address, :final ownerAddress) => [
      if (_formatAddress(address, city: address.city).trim().isNotEmpty)
        DeliveryAddressOption(
          id: 'branch',
          label: _formatAddress(address, city: address.city),
        ),
      if (ownerAddress != null &&
          _formatAddress(
            ownerAddress,
            city: ownerAddress.city,
          ).trim().isNotEmpty)
        DeliveryAddressOption(
          id: 'owner',
          label: _formatAddress(ownerAddress, city: ownerAddress.city),
        ),
    ],
  };
}
