class ManagerLocationFormState {
  final ManagerLocationInfo location;
  final ManagerAddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const ManagerLocationFormState({
    this.location = const ManagerLocationInfo(),
    this.address = const ManagerAddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  ManagerLocationFormState copyWith({
    ManagerLocationInfo? location,
    ManagerAddressInfo? address,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return ManagerLocationFormState(
      location: location ?? this.location,
      address: address ?? this.address,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
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

class ManagerAddressInfo {
  final String city;
  final String area;
  final String street;
  final String building;
  final String floor;
  final String flat;
  final String details;

  const ManagerAddressInfo({
    this.city = '',
    this.area = '',
    this.street = '',
    this.building = '',
    this.floor = '',
    this.flat = '',
    this.details = '',
  });

  ManagerAddressInfo copyWith({
    String? city,
    String? area,
    String? street,
    String? building,
    String? floor,
    String? flat,
    String? details,
  }) {
    return ManagerAddressInfo(
      city: city ?? this.city,
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      flat: flat ?? this.flat,
      details: details ?? this.details,
    );
  }
}
