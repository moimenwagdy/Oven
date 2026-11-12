import 'package:oven/models/alexandria_areas.dart';
import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/signup_providers/personal_signup_provider/personal_signup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  // ---- Address (the city is fixed: see submit) ----
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
  void setLabel(String value) =>
      state = state.copyWith(address: state.address.copyWith(label: value));

  // ---- Submission ----
  Future<bool> submit() async {
    if (state.account.password != state.account.confirmPassword) {
      state = state.copyWith(errorMessage: 'Passwords do not match');
      return false;
    }

    // Read everything needed before the await.
    final account = state.account;
    final address = state.address.copyWith(city: personalCity);
    final repository = ref.read(authRepositoryProvider);
    final sessionNotifier = ref.read(currentSessionProvider.notifier);

    state = state.copyWith(isSubmitting: true, clearError: true);
    try {
      final session = await repository.signUpPersonal(
        name: account.userName,
        email: account.email,
        password: account.password,
        phone: account.phone,
        address: address,
      );
      sessionNotifier.setSession(session);
      state = const PersonalSignupState(); // also drops the password
      return true;
    } on AuthException catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: e.error.message,
      );
      return false;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
      return false;
    }
  }

  void reset() => state = const PersonalSignupState();
}
