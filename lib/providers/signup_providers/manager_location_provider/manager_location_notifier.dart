import 'package:oven/models/auth_session.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/temporary_locations.dart';
import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/signup_providers/manager_location_provider/manager_location_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manager_location_notifier.g.dart';

/// Form for the manager's personal location. Used right after business
/// signup and later from the "add personal address" button in the delivery
/// modal: both need a signed-in manager.
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
  void setLabel(String value) =>
      state = state.copyWith(address: state.address.copyWith(label: value));

  // ---- Submission ----
  /// Saves the personal location on the signed-in manager and refreshes
  /// the session, so the delivery modal shows the new address at once.
  Future<bool> submit() async {
    final session = ref.read(currentSessionProvider);
    if (session is! ManagerSession) {
      state = state.copyWith(errorMessage: 'No business account is signed in');
      return false;
    }

    // Read everything needed before the await.
    final picked = state.location;
    final location = DeliveryLocationInfo(
      // TEMPORARY fallback until the Google Maps API is connected.
      latitude: picked.hasLocation ? picked.latitude! : kTemporaryLatitude,
      longitude: picked.hasLocation ? picked.longitude! : kTemporaryLongitude,
      address: state.address,
    );
    final repository = ref.read(authRepositoryProvider);
    final sessionNotifier = ref.read(currentSessionProvider.notifier);

    state = state.copyWith(isSubmitting: true, clearError: true);
    try {
      final updated = await repository.setManagerPersonalLocation(
        managerId: session.id,
        location: location,
      );
      sessionNotifier.replaceIfSameUser(updated);
      state = const ManagerLocationFormState();
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

  /// "Skip" on the post-signup step. Nothing is saved: the manager stays
  /// without a personal location and can add it later from the modal.
  void skip() => state = const ManagerLocationFormState();

  void reset() => state = const ManagerLocationFormState();
}
