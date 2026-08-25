import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'signup_form_notifier.g.dart';

@Riverpod(keepAlive: true)
class SignupNotifier extends _$SignupNotifier {
  @override
  SignupState build() {
    return const SignupState();
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
  // Business
  // ==========================================================

  void setTrademarkName(String value) {
    state = state.copyWith(
      business: state.business.copyWith(trademarkName: value),
    );
  }

  void setBranchName(String value) {
    state = state.copyWith(
      business: state.business.copyWith(branchName: value),
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
    state = state.copyWith(location: const LocationInfo());
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
  // Submission
  // ==========================================================

  Future<bool> submit() async {
    // final latitude = state.location.latitude;
    // final longitude = state.location.longitude;

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
      final success = await ref
          .read(fakeAuthProvider.notifier)
          .signUp(
            name: state.account.userName,
            phone: state.account.phone,
            latitude: 0.1216516,
            longitude: 0.1216516,
            email: state.account.email,
            password: state.account.password,
            trademarkId: state.business.trademarkName,
            branchId: state.business.branchName,
            addressinfo: state.address,
          );

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

  void reset() {
    state = const SignupState();
  }
}



// import 'package:oven/providers/authentication_provider/auth_provider.dart';
// import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_state_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//// part 'signup_form_notifier.g.dart'; // @Riverpod(keepAlive: true)
///// class SignupFormNotifier extends _$SignupFormNotifier {
/////   @override//   SignupFormState build() => const SignupFormState(); 
/////   // ---- page 1 setters ----//   void setName(String v) {//     print("setName called: '$v'"); //     state = state.copyWith(name: v);//   } //   void setPhone(String v) => state = state.copyWith(phone: v);//   void setAddress(String v) => state = state.copyWith(address: v);//   void setEmail(String v) {//     print("setEmail called: '$v'"); //     state = state.copyWith(email: v);//   } //   void setPassword(String v) => state = state.copyWith(password: v);//   void setRepeatPassword(String v) => state = state.copyWith(repeatPassword: v); //   // ---- page 2 setters ----//   void setTrademarkName(String v) => state = state.copyWith(trademarkName: v);//   void setBranchName(String v) => state = state.copyWith(branchName: v);//   void setCity(String v) => state = state.copyWith(city: v);//   void setBranchAddress(String v) => state = state.copyWith(branchAddress: v);//   void setLocation(double lat, double lng) =>//       state = state.copyWith(latitude: lat, longitude: lng); //   Future<bool> submit() async {//     print("***** signupNotifier ${state.email}");//     state = state.copyWith(isSubmitting: true, errorMessage: null);//     try {//       final success = await ref//           .read(fakeAuthProvider.notifier)//           .signUp(//             name: state.name,