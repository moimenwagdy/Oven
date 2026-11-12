import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

class SignInState {
  final bool isSubmitting;
  final String? errorMessage;

  const SignInState({this.isSubmitting = false, this.errorMessage});
}

/// keepAlive on purpose: the login screen is usually replaced as soon as
/// the session is set, and an auto-disposed notifier would then throw when
/// the request finishes and the state is updated.
@Riverpod(keepAlive: true)
class SignIn extends _$SignIn {
  @override
  SignInState build() => const SignInState();

  Future<bool> submit({required String email, required String password}) async {
    // Read everything needed before the await.
    final repository = ref.read(authRepositoryProvider);
    final sessionNotifier = ref.read(currentSessionProvider.notifier);

    state = const SignInState(isSubmitting: true);
    try {
      final session = await repository.signIn(email: email, password: password);
      sessionNotifier.setSession(session);
      state = const SignInState();
      return true;
    } on AuthException catch (e) {
      state = SignInState(errorMessage: e.error.message);
      return false;
    } catch (e) {
      state = SignInState(errorMessage: e.toString());
      return false;
    }
  }

  void reset() => state = const SignInState();
}
