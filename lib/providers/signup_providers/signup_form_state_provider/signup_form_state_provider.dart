class SignupFormState {
  const SignupFormState({
    // Page 1 — user data
    this.name = '',
    this.phone = '',
    this.address = '',
    this.email = '',
    this.password = '',
    this.repeatPassword = '',

    // Page 2 — trademark/branch data
    this.trademarkName = '',
    this.branchName = '',
    this.city = '',
    this.branchAddress = '',
    this.latitude,
    this.longitude,

    this.isSubmitting = false,
    this.errorMessage,
  });

  final String name;
  final String phone;
  final String address;
  final String email;
  final String password;
  final String repeatPassword;

  final String trademarkName;
  final String branchName;
  final String city;
  final String branchAddress;
  final double? latitude;
  final double? longitude;

  final bool isSubmitting;
  final String? errorMessage;

  SignupFormState copyWith({
    String? name,
    String? phone,
    String? address,
    String? email,
    String? password,
    String? repeatPassword,
    String? trademarkName,
    String? branchName,
    String? city,
    String? branchAddress,
    double? latitude,
    double? longitude,
    bool? isSubmitting,
    // wrap nullable-clearable field so you can explicitly reset it to null
    Object? errorMessage = _sentinel,
  }) {
    return SignupFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      email: email ?? this.email,
      password: password ?? this.password,
      repeatPassword: repeatPassword ?? this.repeatPassword,
      trademarkName: trademarkName ?? this.trademarkName,
      branchName: branchName ?? this.branchName,
      city: city ?? this.city,
      branchAddress: branchAddress ?? this.branchAddress,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: identical(errorMessage, _sentinel)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }

  static const _sentinel = Object();
}
