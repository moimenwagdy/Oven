class ExternalManagerSignupState {
  final AccountInfo account;
  final LocationInfos location;
  final AddressInfo address;

  const ExternalManagerSignupState({
    this.account = const AccountInfo(),
    this.location = const LocationInfos(),
    this.address = const AddressInfo(),
  });

  ExternalManagerSignupState copyWith({
    AccountInfo? account,
    LocationInfos? location,
    AddressInfo? address,
  }) {
    return ExternalManagerSignupState(
      account: account ?? this.account,
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }
}

// ============================================================
// Account information
// ============================================================

class AccountInfo {
  final String userName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  const AccountInfo({
    this.userName = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  AccountInfo copyWith({
    String? userName,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return AccountInfo(
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

// ============================================================
// Location information
// ============================================================

class LocationInfos {
  final double? latitude;
  final double? longitude;

  const LocationInfos({this.latitude, this.longitude});

  LocationInfos copyWith({double? latitude, double? longitude}) {
    return LocationInfos(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  bool get hasLocation => latitude != null && longitude != null;
}

// ============================================================
// Address information
// ============================================================

class AddressInfo {
  final String city;
  final String area;
  final String street;
  final String building;
  final String floor;
  final String flat;
  final String details;

  const AddressInfo({
    this.city = '',
    this.area = '',
    this.street = '',
    this.building = '',
    this.floor = '',
    this.flat = '',
    this.details = '',
  });

  AddressInfo copyWith({
    String? city,
    String? area,
    String? street,
    String? building,
    String? floor,
    String? flat,
    String? details,
  }) {
    return AddressInfo(
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
