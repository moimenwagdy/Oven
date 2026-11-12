import 'package:oven/models/address_info.dart';

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
