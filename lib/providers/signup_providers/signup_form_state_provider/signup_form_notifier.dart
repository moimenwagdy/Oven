import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'signup_form_notifier.g.dart';

@Riverpod(keepAlive: true)
class SignupFormNotifier extends _$SignupFormNotifier {
  @override
  SignupFormState build() => const SignupFormState();

  // ---- page 1 setters ----
  void setName(String v) {
    print("setName called: '$v'");

    state = state.copyWith(name: v);
  }

  void setPhone(String v) => state = state.copyWith(phone: v);
  void setAddress(String v) => state = state.copyWith(address: v);
  void setEmail(String v) {
    print("setEmail called: '$v'");

    state = state.copyWith(email: v);
  }

  void setPassword(String v) => state = state.copyWith(password: v);
  void setRepeatPassword(String v) => state = state.copyWith(repeatPassword: v);

  // ---- page 2 setters ----
  void setTrademarkName(String v) => state = state.copyWith(trademarkName: v);
  void setBranchName(String v) => state = state.copyWith(branchName: v);
  void setCity(String v) => state = state.copyWith(city: v);
  void setBranchAddress(String v) => state = state.copyWith(branchAddress: v);
  void setLocation(double lat, double lng) =>
      state = state.copyWith(latitude: lat, longitude: lng);

  Future<bool> submit() async {
    print("***** signupNotifier ${state.email}");
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      final success = await ref
          .read(fakeAuthProvider.notifier)
          .signUp(
            name: state.name,
            phone: state.phone,
            address: state.address,
            email: state.email,
            password: state.password,
            trademarkId: state.trademarkName,
            branchId: state.branchName,
            branchAddress: state.branchAddress,
            location: "location",
          );

      state = state.copyWith(
        isSubmitting: false,
        errorMessage: success ? null : "Email already in use",
      );
      print("signup success = $success");
      print("auth state = ${ref.read(fakeAuthProvider).value?.name}");

      return success;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
      return false;
    }
  }
}
