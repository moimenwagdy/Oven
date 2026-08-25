// ============================================================
// File: signup_state.dart
// Path: lib/features/signup/providers/signup_state.dart
// Goal: Defines the immutable state for the multi-step signup
//       flow. The state is grouped into account, business,
//       location, and address information.
// ============================================================

class SignupState {
  final AccountInfo account;
  final BusinessInfo business;
  final LocationInfo location;
  final AddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const SignupState({
    this.account = const AccountInfo(),
    this.business = const BusinessInfo(),
    this.location = const LocationInfo(),
    this.address = const AddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  SignupState copyWith({
    AccountInfo? account,
    BusinessInfo? business,
    LocationInfo? location,
    AddressInfo? address,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return SignupState(
      account: account ?? this.account,
      business: business ?? this.business,
      location: location ?? this.location,
      address: address ?? this.address,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
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
// Business information
// ============================================================

class BusinessInfo {
  final String trademarkName;
  final String branchName;

  const BusinessInfo({this.trademarkName = '', this.branchName = ''});

  BusinessInfo copyWith({String? trademarkName, String? branchName}) {
    return BusinessInfo(
      trademarkName: trademarkName ?? this.trademarkName,
      branchName: branchName ?? this.branchName,
    );
  }
}

// ============================================================
// Location information
// ============================================================

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
