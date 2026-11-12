import 'package:oven/models/address_info.dart';

/// Internal record of the fake data source for personal accounts.
/// No coordinates: personal delivery is Alexandria only.
class PersonalUser {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final AddressInfo address;

  const PersonalUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });
}
