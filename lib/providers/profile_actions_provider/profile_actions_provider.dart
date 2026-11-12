import 'package:oven/models/address_info.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/providers/authentication_provider/auth.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_actions_provider.g.dart';

/// Profile edits for the signed-in user (manager or personal).
/// Each method returns null on success, or an error message.
@Riverpod(keepAlive: true)
class ProfileActions extends _$ProfileActions {
  @override
  void build() {}

  Future<String?> updateName(String name) {
    if (name.trim().isEmpty) return Future.value('Name cannot be empty');
    return _update(
      (repository, userId) =>
          repository.updateProfile(userId: userId, name: name),
    );
  }

  Future<String?> updateEmail(String email) {
    if (email.trim().isEmpty) return Future.value('Email cannot be empty');
    return _update(
      (repository, userId) =>
          repository.updateProfile(userId: userId, email: email),
    );
  }

  Future<String?> updatePhone(String phone) {
    if (phone.trim().isEmpty) return Future.value('Phone cannot be empty');
    return _update(
      (repository, userId) =>
          repository.updateProfile(userId: userId, phone: phone),
    );
  }

  Future<String?> updateManagerAdress(DeliveryLocationInfo address) {
    return _update(
      (repository, userId) =>
          repository.updateProfile(userId: userId, address: address),
    );
  }

  Future<String?> updatepersonalAddress(AddressInfo personalAddress) {
    return _update(
      (repository, userId) => repository.updateProfile(
        userId: userId,
        persoanlUserAdress: personalAddress,
      ),
    );
  }

  Future<String?> _update(
    Future<AuthSession> Function(AuthRepository repository, String userId)
    action,
  ) async {
    final session = ref.read(currentSessionProvider);
    if (session == null) return 'Not signed in';

    // Read everything needed before the await.
    final repository = ref.read(authRepositoryProvider);
    final sessionNotifier = ref.read(currentSessionProvider.notifier);

    try {
      final updated = await action(repository, session.id);
      sessionNotifier.replaceIfSameUser(updated);
      return null;
    } on AuthException catch (e) {
      return e.error.message;
    } catch (e) {
      return e.toString();
    }
  }
}
