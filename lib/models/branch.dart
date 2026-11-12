import 'package:oven/models/delivery_location_info.dart';

class Branch {
  final String id;
  final String trademarkId;
  final String name;

  /// Ids of the managers of this branch (branch-level managers only).
  final List<String> managerIds;
  final DeliveryLocationInfo location;

  const Branch({
    required this.id,
    required this.trademarkId,
    required this.name,
    required this.managerIds,
    required this.location,
  });

  Branch copyWith({
    String? id,
    String? trademarkId,
    String? name,
    List<String>? managerIds,
    DeliveryLocationInfo? location,
  }) {
    return Branch(
      id: id ?? this.id,
      trademarkId: trademarkId ?? this.trademarkId,
      name: name ?? this.name,
      managerIds: managerIds ?? this.managerIds,
      location: location ?? this.location,
    );
  }
}
