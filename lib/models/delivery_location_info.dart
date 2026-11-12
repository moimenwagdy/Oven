// Adjust this import if AddressInfo is defined elsewhere in your project.
import 'package:oven/models/address_info.dart';

class DeliveryLocationInfo {
  final double latitude;
  final double longitude;
  final AddressInfo address;

  const DeliveryLocationInfo({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  DeliveryLocationInfo copyWith({
    double? latitude,
    double? longitude,
    AddressInfo? address,
  }) {
    return DeliveryLocationInfo(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
    );
  }
}
