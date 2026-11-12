import 'package:oven/models/address_info.dart';

class PersonalSignupState {
  final PersonalAccountInfo account;
  final AddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const PersonalSignupState({
    this.account = const PersonalAccountInfo(),
    this.address = const AddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  PersonalSignupState copyWith({
    PersonalAccountInfo? account,
    AddressInfo? address,
    bool? isSubmitting,
    String? errorMessage,
    bool clearError = false,
  }) {
    return PersonalSignupState(
      account: account ?? this.account,
      address: address ?? this.address,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class PersonalAccountInfo {
  final String userName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  const PersonalAccountInfo({
    this.userName = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  PersonalAccountInfo copyWith({
    String? userName,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return PersonalAccountInfo(
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
