import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/temporary_locations.dart';
import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/branches_provider/branch_action_provider.dart';
import 'package:oven/providers/profile_actions_provider/edit_adress_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'edit_adress_form_notifier.g.dart';

@Riverpod(keepAlive: true)
class EditAddressForm extends _$EditAddressForm {
  @override
  EditBusinessAddressFormState build() => const EditBusinessAddressFormState();

  void initiateToEdit(DeliveryLocationInfo current) {
    state = state.copyWith(
      address: current.address,
      location: LocationInfo(
        latitude: current.latitude,
        longitude: current.longitude,
      ),
    );
  }

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
  Future<bool> submit(String branchId) async {
    // Read everything needed before the await.
    final picked = state.location;
    final branchLocation = DeliveryLocationInfo(
      latitude: picked.hasLocation ? picked.latitude! : kTemporaryLatitude,
      longitude: picked.hasLocation ? picked.longitude! : kTemporaryLongitude,
      address: state.address,
    );

    state = state.copyWith(isSubmitting: true, clearError: true);
    try {
      ref
          .read(branchActionsProvider.notifier)
          .updateLocation(branchId: branchId, location: branchLocation);
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

  void reset() => state = const EditBusinessAddressFormState();

  bool allStateIsValid() {
    return state.location.hasLocation &&
        state.address.city.isNotEmpty &&
        state.address.area.isNotEmpty &&
        state.address.street.isNotEmpty &&
        state.address.building.isNotEmpty;
  }
}
