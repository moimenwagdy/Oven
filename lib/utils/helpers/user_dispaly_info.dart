import 'package:oven/providers/authentication_provider/auth_provider.dart';

/// Flat, screen-ready view of a FakeUser — safe to use anywhere in the
/// app without knowing or caring whether the underlying user is
/// personal or business. Fields that don't apply to a given user are
/// simply null instead of throwing or being unavailable.
class UserDisplayInfo {
  final String id;
  final String name;
  final String email;
  final String phone;
  final LoggerState loggerState;

  // Address — common subset present for both personal and business.
  final String area;
  final String street;
  final String building;
  final String floor;
  final String flat;
  final String details;

  // Business-only. Null for personal users.
  final String? city;
  final String? trademarkId;
  final String? branchId;
  final double? latitude;
  final double? longitude;

  // Business-only, and only set once the owner completes that
  // optional post-signup step. Null otherwise.
  final double? ownerLatitude;
  final double? ownerLongitude;
  final String? ownerCity;
  final String? ownerArea;
  final String? ownerStreet;
  final String? ownerBuilding;
  final String? ownerFloor;
  final String? ownerFlat;
  final String? ownerDetails;

  const UserDisplayInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.loggerState,
    required this.area,
    required this.street,
    required this.building,
    required this.floor,
    required this.flat,
    required this.details,
    this.city,
    this.trademarkId,
    this.branchId,
    this.latitude,
    this.longitude,
    this.ownerLatitude,
    this.ownerLongitude,
    this.ownerCity,
    this.ownerArea,
    this.ownerStreet,
    this.ownerBuilding,
    this.ownerFloor,
    this.ownerFlat,
    this.ownerDetails,
  });

  bool get isBusiness => loggerState == LoggerState.business;
  bool get hasOwnerLocation => ownerLatitude != null && ownerLongitude != null;
}

/// Converts a FakeUser (or null, if nobody's logged in) into a flat
/// UserDisplayInfo. This is the ONE place that switches on the user
/// type — call sites never need to.
UserDisplayInfo? extractUserInfo(FakeUser? user) {
  if (user == null) return null;
  return switch (user) {
    PersonalFakeUser(:final address) => UserDisplayInfo(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      loggerState: user.loggerState,
      area: address.area,
      street: address.street,
      building: address.building,
      floor: address.floor,
      flat: address.flat,
      details: address.details,
    ),
    BusinessFakeUser(:final address) => UserDisplayInfo(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      loggerState: user.loggerState,
      area: address.area,
      street: address.street,
      building: address.building,
      floor: address.floor,
      flat: address.flat,
      details: address.details,
      city: address.city,
      trademarkId: user.trademarkId,
      branchId: user.branchId,
      latitude: user.latitude,
      longitude: user.longitude,
      ownerLatitude: user.ownerLatitude,
      ownerLongitude: user.ownerLongitude,
      ownerCity: user.ownerAddress?.city,
      ownerArea: user.ownerAddress?.area,
      ownerStreet: user.ownerAddress?.street,
      ownerBuilding: user.ownerAddress?.building,
      ownerFloor: user.ownerAddress?.floor,
      ownerFlat: user.ownerAddress?.flat,
      ownerDetails: user.ownerAddress?.details,
    ),
  };
}
