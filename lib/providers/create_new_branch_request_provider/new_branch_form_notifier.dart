import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/temporary_locations.dart';
import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/create_new_branch_request_provider/new_branch_request_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'new_branch_form_notifier.g.dart';

@Riverpod(keepAlive: true)
class NewBranchRequestFormNotifier extends _$NewBranchRequestFormNotifier {
  @override
  NewBranchRequestFormState build() => const NewBranchRequestFormState();

  void setBranchName(String value) => state = state.copyWith(branchName: value);

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
    // Read everything needed before the await.
    final picked = state.location;
    final branchLocation = DeliveryLocationInfo(
      // TEMPORARY fallback until the Google Maps API is connected.
      latitude: picked.hasLocation ? picked.latitude! : kTemporaryLatitude,
      longitude: picked.hasLocation ? picked.longitude! : kTemporaryLongitude,
      address: state.address,
    );

    state = state.copyWith(isSubmitting: true, clearError: true);
    try {
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

  void reset() => state = const NewBranchRequestFormState();
}
