import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/temporary_locations.dart';
import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/signup_providers/bussines_signup_form_state_provider/signup_form_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_form_notifier.g.dart';

@Riverpod(keepAlive: true)
class BusinessSignupNotifier extends _$BusinessSignupNotifier {
  @override
  BusinessSignupState build() => const BusinessSignupState();

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

  // ---- Business ----
  void setTrademarkName(String value) => state = state.copyWith(
    business: state.business.copyWith(trademarkName: value),
  );
  void setBranchName(String value) => state = state.copyWith(
    business: state.business.copyWith(branchName: value),
  );

  // ---- Location ----
  void setLocation({required double latitude, required double longitude}) {
    state = state.copyWith(
      location: state.location.copyWith(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  void clearLocation() =>
      state = state.copyWith(location: const LocationInfo());

  // ---- Address ----
  void setCity(String value) =>
      state = state.copyWith(address: state.address.copyWith(city: value));
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
  /// Creates the manager, the trademark and its main branch, then signs the
  /// new manager in. The manager's personal location is a separate, optional
  /// step handled by ManagerLocationNotifier.
  Future<bool> submit() async {
    if (state.account.password != state.account.confirmPassword) {
      state = state.copyWith(errorMessage: 'Passwords do not match');
      return false;
    }

    // Read everything needed before the await.
    final account = state.account;
    final business = state.business;
    final picked = state.location;
    final branchLocation = DeliveryLocationInfo(
      // TEMPORARY fallback until the Google Maps API is connected.
      latitude: picked.hasLocation ? picked.latitude! : kTemporaryLatitude,
      longitude: picked.hasLocation ? picked.longitude! : kTemporaryLongitude,
      address: state.address,
    );
    final repository = ref.read(authRepositoryProvider);
    final sessionNotifier = ref.read(currentSessionProvider.notifier);

    state = state.copyWith(isSubmitting: true, clearError: true);
    try {
      final session = await repository.signUpBusiness(
        name: account.userName,
        email: account.email,
        password: account.password,
        phone: account.phone,
        trademarkName: business.trademarkName,
        branchName: business.branchName,
        branchLocation: branchLocation,
      );
      sessionNotifier.setSession(session);
      state = const BusinessSignupState(); // also drops the password
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

  void reset() => state = const BusinessSignupState();
}
