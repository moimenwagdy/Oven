import 'package:oven/providers/signup_providers/external_signup_manager_form_state_provider/external_manager_signup_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'exernal_manager_signup_notifier.g.dart';

@Riverpod(keepAlive: true)
class ExternalManagerSignupNotifier extends _$ExternalManagerSignupNotifier {
  @override
  ExternalManagerSignupState build() {
    return const ExternalManagerSignupState();
  }

  // ==========================================================
  // Account
  // ==========================================================

  void setUserName(String value) {
    state = state.copyWith(account: state.account.copyWith(userName: value));
  }

  void setPhone(String value) {
    state = state.copyWith(account: state.account.copyWith(phone: value));
  }

  void setEmail(String value) {
    state = state.copyWith(account: state.account.copyWith(email: value));
  }

  void setPassword(String value) {
    state = state.copyWith(account: state.account.copyWith(password: value));
  }

  void setConfirmPassword(String value) {
    state = state.copyWith(
      account: state.account.copyWith(confirmPassword: value),
    );
  }

  // ==========================================================
  // Location
  // ==========================================================

  void setLocation({required double latitude, required double longitude}) {
    state = state.copyWith(
      location: state.location.copyWith(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  void clearLocation() {
    state = state.copyWith(location: const LocationInfos());
  }

  // ==========================================================
  // Address
  // ==========================================================

  void setCity(String value) {
    state = state.copyWith(address: state.address.copyWith(city: value));
  }

  void setArea(String value) {
    state = state.copyWith(address: state.address.copyWith(area: value));
  }

  void setStreet(String value) {
    state = state.copyWith(address: state.address.copyWith(street: value));
  }

  void setBuilding(String value) {
    state = state.copyWith(address: state.address.copyWith(building: value));
  }

  void setFloor(String value) {
    state = state.copyWith(address: state.address.copyWith(floor: value));
  }

  void setFlat(String value) {
    state = state.copyWith(address: state.address.copyWith(flat: value));
  }

  void setDetails(String value) {
    state = state.copyWith(address: state.address.copyWith(details: value));
  }

  // ==========================================================
  // Draft management
  // ==========================================================

  void reset() {
    state = const ExternalManagerSignupState();
  }
}
