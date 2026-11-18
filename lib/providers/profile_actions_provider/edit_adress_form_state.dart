import 'package:oven/models/address_info.dart';

class EditBusinessAddressFormState {
  final LocationInfo location;
  final AddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const EditBusinessAddressFormState({
    this.location = const LocationInfo(),
    this.address = const AddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  EditBusinessAddressFormState copyWith({
    LocationInfo? location,
    AddressInfo? address,
    bool? isSubmitting,
    String? errorMessage,
    bool clearError = false,
  }) {
    return EditBusinessAddressFormState(
      location: location ?? this.location,
      address: address ?? this.address,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class LocationInfo {
  final double? latitude;
  final double? longitude;

  const LocationInfo({this.latitude, this.longitude});

  LocationInfo copyWith({double? latitude, double? longitude}) {
    return LocationInfo(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  bool get hasLocation => latitude != null && longitude != null;
}
