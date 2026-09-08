class PersonalSignupState {
  final PersonalAccountInfo account;
  final PersonalAddressInfo address;
  final bool isSubmitting;
  final String? errorMessage;

  const PersonalSignupState({
    this.account = const PersonalAccountInfo(),
    this.address = const PersonalAddressInfo(),
    this.isSubmitting = false,
    this.errorMessage,
  });

  PersonalSignupState copyWith({
    PersonalAccountInfo? account,
    PersonalAddressInfo? address,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return PersonalSignupState(
      account: account ?? this.account,
      address: address ?? this.address,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
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

class PersonalAddressInfo {
  final String area;
  final String street;
  final String building;
  final String floor;
  final String flat;
  final String details;

  const PersonalAddressInfo({
    this.area = '',
    this.street = '',
    this.building = '',
    this.floor = '',
    this.flat = '',
    this.details = '',
  });

  PersonalAddressInfo copyWith({
    String? area,
    String? street,
    String? building,
    String? floor,
    String? flat,
    String? details,
  }) {
    return PersonalAddressInfo(
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      flat: flat ?? this.flat,
      details: details ?? this.details,
    );
  }
}
