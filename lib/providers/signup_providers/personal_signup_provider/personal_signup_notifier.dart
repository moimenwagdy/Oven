import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/signup_providers/personal_signup_provider/personal_signup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';
part 'personal_signup_notifier.g.dart';

@Riverpod(keepAlive: true)
class PersonalSignupNotifier extends _$PersonalSignupNotifier {
  @override
  PersonalSignupState build() => const PersonalSignupState();

  // ---- Account ----
  void setUserName(String value) =>
      state = state.copyWith(account: state.account.copyWith(userName: value));
  void setPhone(String value) =>
      state = state.copyWith(account: state.account.copyWith(phone: value));
  void setEmail(String value) =>
      state = state.copyWith(account: state.account.copyWith(email: value));
  void setPassword(String value) =>
      state = state.copyWith(account: state.account.copyWith(password: value));
  void setConfirmPassword(String value) => state = state.copyWith(
    account: state.account.copyWith(confirmPassword: value),
  );

  // ---- Address ----
  void setArea(String value) =>
      state = state.copyWith(address: state.address.copyWith(area: value));
  void setStreet(String value) =>
      state = state.copyWith(address: state.address.copyWith(street: value));
  void setBuilding(String value) =>
      state = state.copyWith(address: state.address.copyWith(building: value));
  void setFloor(String value) =>
      state = state.copyWith(address: state.address.copyWith(floor: value));
  void setFlat(String value) =>
      state = state.copyWith(address: state.address.copyWith(flat: value));
  void setDetails(String value) =>
      state = state.copyWith(address: state.address.copyWith(details: value));

  // ---- Submission ----
  Future<bool> submit() async {
    if (state.account.password != state.account.confirmPassword) {
      state = state.copyWith(errorMessage: "Passwords do not match");
      return false;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      final newUser = PersonalFakeUser(
        id: Uuid().v4().substring(0, 6),
        name: state.account.userName,
        email: state.account.email,
        password: state.account.password,
        phone: state.account.phone,
        address: state.address,
      );

      final success = await ref.read(fakeAuthProvider.notifier).signUp(newUser);

      state = state.copyWith(
        isSubmitting: false,
        errorMessage: success ? null : "Email already in use",
      );
      return success;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
      return false;
    }
  }

  void reset() => state = const PersonalSignupState();
}
