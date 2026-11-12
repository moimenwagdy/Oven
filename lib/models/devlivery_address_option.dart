/// One selectable delivery address, tagged with a stable id.
/// Ids: 'branch:<branchId>', 'owner' (manager's personal location),
/// 'personal' (personal user's address).
class DeliveryAddressOption {
  final String id;
  final String label;

  const DeliveryAddressOption({required this.id, required this.label});
}
