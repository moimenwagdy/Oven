import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/signup_providers/bussines_signup_form_state_provider/signup_form_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
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
  Future<bool> submit() async {
    final latitude = 0.12165166541;
    final longitude = 0.251516511;

    // if (latitude == null || longitude == null) {
    //   state = state.copyWith(
    //     errorMessage: "Please select a location before submitting",
    //   );
    //   return false;
    // }

    if (state.account.password != state.account.confirmPassword) {
      state = state.copyWith(errorMessage: "Passwords do not match");
      return false;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      final newUser = BusinessFakeUser(
        id: Uuid().v4().substring(0, 6),
        name: state.account.userName,
        email: state.account.email,
        password: state.account.password,
        phone: state.account.phone,
        trademarkId: state.business.trademarkName,
        branchId: state.business.branchName,
        latitude: latitude,
        longitude: longitude,
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

  void reset() => state = const BusinessSignupState();
}
