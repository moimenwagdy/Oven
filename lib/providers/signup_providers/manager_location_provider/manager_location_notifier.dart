import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/signup_providers/bussines_signup_form_state_provider/signup_form_state_provider.dart';
import 'package:oven/providers/signup_providers/manager_location_provider/manager_location_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'manager_location_notifier.g.dart';

@Riverpod(keepAlive: true)
class ManagerLocationNotifier extends _$ManagerLocationNotifier {
  @override
  ManagerLocationFormState build() => const ManagerLocationFormState();

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
      state = state.copyWith(location: const ManagerLocationInfo());

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
  /// Saves the owner's location/address onto the currently logged-in
  /// business user. This step is only reachable from the business signup
  /// flow, so the logged-in user here is always the one who just signed up.
  Future<bool> submit() async {
    // final latitude = state.location.latitude;
    // final longitude = state.location.longitude;
    final latitude = 0.215611;
    final longitude = 0.516511612;

    if (latitude == null || longitude == null) {
      state = state.copyWith(
        errorMessage: "Please select a location on the map",
      );
      return false;
    }

    final currentUser = ref.read(fakeAuthProvider).value;
    if (currentUser is! BusinessFakeUser) {
      state = state.copyWith(errorMessage: "No business account is signed in");
      return false;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    final success = await ref
        .read(fakeAuthProvider.notifier)
        .updateOwnerLocation(
          userId: currentUser.id,
          latitude: latitude,
          longitude: longitude,
          address: AddressInfo(
            city: state.address.city,
            area: state.address.area,
            street: state.address.street,
            building: state.address.building,
            floor: state.address.floor,
            flat: state.address.flat,
            details: state.address.details,
          ),
        );

    state = state.copyWith(
      isSubmitting: false,
      errorMessage: success ? null : "Could not save your location",
    );

    return success;
  }

  /// Called when the user taps "Skip" on this step. Deliberately does
  /// NOT touch fakeAuthProvider — the business user simply keeps
  /// ownerLatitude/ownerLongitude/ownerAddress as null, and can complete
  /// this step later from wherever "add your location" is offered.
  void skip() => state = const ManagerLocationFormState();

  void reset() => state = const ManagerLocationFormState();
}
