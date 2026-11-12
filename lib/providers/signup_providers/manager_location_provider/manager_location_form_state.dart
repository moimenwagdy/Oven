import 'package:oven/models/address_info.dart';

class ManagerLocationFormState {
  final ManagerLocationInfo location;
  final AddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const ManagerLocationFormState({
    this.location = const ManagerLocationInfo(),
    this.address = const AddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  ManagerLocationFormState copyWith({
    ManagerLocationInfo? location,
    AddressInfo? address,
    bool? isSubmitting,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ManagerLocationFormState(
      location: location ?? this.location,
      address: address ?? this.address,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class ManagerLocationInfo {
  final double? latitude;
  final double? longitude;

  const ManagerLocationInfo({this.latitude, this.longitude});

  ManagerLocationInfo copyWith({double? latitude, double? longitude}) {
    return ManagerLocationInfo(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  bool get hasLocation => latitude != null && longitude != null;
}
