import 'package:oven/models/address_info.dart';

class NewBranchRequestFormState {
  final String branchName;
  final LocationInfo location;
  final AddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const NewBranchRequestFormState({
    this.branchName = "",
    this.location = const LocationInfo(),
    this.address = const AddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  NewBranchRequestFormState copyWith({
    LocationInfo? location,
    AddressInfo? address,
    String? branchName,
    bool? isSubmitting,
    String? errorMessage,
    bool clearError = false,
  }) {
    return NewBranchRequestFormState(
      branchName: branchName ?? this.branchName,
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
