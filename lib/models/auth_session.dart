import 'package:oven/models/address_info.dart';
import 'package:oven/models/delivery_location_info.dart';

/// What the app knows about the logged-in user. No password.
sealed class AuthSession {
  final String id;
  final String name;
  final String email;
  final String phone;

  const AuthSession({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
}

class PersonalSession extends AuthSession {
  final AddressInfo address;

  const PersonalSession({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required this.address,
  });
}

class ManagerSession extends AuthSession {
  /// The manager's personal location. Null until it is set from the map.
  final DeliveryLocationInfo? personalLocation;

  const ManagerSession({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    this.personalLocation,
  });
}
