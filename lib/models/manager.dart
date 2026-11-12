import 'package:oven/models/delivery_location_info.dart';

/// Internal record of the fake data source (it holds the password).
/// The app itself only sees the session built from it.
class Manager {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;

  /// The manager's personal location. Optional, set later from the map.
  final DeliveryLocationInfo? address;

  const Manager({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.address,
  });

  Manager copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    DeliveryLocationInfo? address,
    bool clearAddress = false,
  }) {
    return Manager(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: clearAddress ? null : address ?? this.address,
    );
  }
}
