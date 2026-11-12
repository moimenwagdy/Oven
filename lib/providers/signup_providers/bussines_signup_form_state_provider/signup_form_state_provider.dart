import 'package:oven/models/address_info.dart';

class BusinessSignupState {
  final AccountInfo account;
  final BusinessInfo business;
  final LocationInfo location;
  final AddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const BusinessSignupState({
    this.account = const AccountInfo(),
    this.business = const BusinessInfo(),
    this.location = const LocationInfo(),
    this.address = const AddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  BusinessSignupState copyWith({
    AccountInfo? account,
    BusinessInfo? business,
    LocationInfo? location,
    AddressInfo? address,
    bool? isSubmitting,
    String? errorMessage,
    bool clearError = false,
  }) {
    return BusinessSignupState(
      account: account ?? this.account,
      business: business ?? this.business,
      location: location ?? this.location,
      address: address ?? this.address,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

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
