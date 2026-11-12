import 'package:oven/models/address_info.dart';
import 'package:oven/models/alexandria_areas.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/models/branch.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/manager.dart';
import 'package:oven/models/personal_user.dart';
import 'package:oven/models/trademark.dart';
import 'package:oven/providers/fake_database/fake_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth.g.dart';

enum AuthError {
  invalidCredentials,
  emailTaken,
  outsideServiceArea,
  userNotFound,
}

class AuthException implements Exception {
  final AuthError error;
  const AuthException(this.error);

  @override
  String toString() => 'AuthException($error)';
}

/// Text for each error. Move to localization later.
extension AuthErrorMessage on AuthError {
  String get message => switch (this) {
    AuthError.invalidCredentials => 'Invalid email or password',
    AuthError.emailTaken => 'Email already in use',
    AuthError.outsideServiceArea =>
      'Personal accounts are available in Alexandria only',
    AuthError.userNotFound => 'Account not found',
  };
}

/// Fake backend for sign in / sign up. When the API arrives, only this
/// class changes: the methods keep their signatures.
class AuthRepository {
  AuthRepository(this._db);

  final FakeDatabase _db;

  // Simulates network time. Remove it if it gets in the way.
  Future<void> _fakeDelay() =>
      Future<void>.delayed(const Duration(milliseconds: 300));

  String _key(String email) => email.trim().toLowerCase();

  String _newId(String prefix) =>
      '$prefix-${DateTime.now().microsecondsSinceEpoch}';

  /// Emails are unique across managers AND personal users.
  bool _emailTaken(String email) {
    final key = _key(email);
    return _db.managers.any((m) => _key(m.email) == key) ||
        _db.personalUsers.any((u) => _key(u.email) == key);
  }

  ManagerSession _managerSession(Manager m) => ManagerSession(
    id: m.id,
    name: m.name,
    email: m.email,
    phone: m.phone,
    personalLocation: m.address,
  );

  PersonalSession _personalSession(PersonalUser u) => PersonalSession(
    id: u.id,
    name: u.name,
    email: u.email,
    phone: u.phone,
    address: u.address,
  );

  Future<AuthSession> signIn({
    required String email,
    required String password,
  }) async {
    await _fakeDelay();
    final key = _key(email);

    final manager = _db.managers
        .where((m) => _key(m.email) == key && m.password == password)
        .firstOrNull;
    if (manager != null) return _managerSession(manager);

    final personal = _db.personalUsers
        .where((u) => _key(u.email) == key && u.password == password)
        .firstOrNull;
    if (personal != null) return _personalSession(personal);

    throw const AuthException(AuthError.invalidCredentials);
  }

  /// Rebuilds the session for a saved user id. Null if that user no longer
  /// exists: the fake database resets on every full restart, so users that
  /// signed up in an earlier run are gone. With the real API this becomes
  /// a "current user" request that uses the saved token.
  Future<AuthSession?> restoreSession(String userId) async {
    await _fakeDelay();

    final manager = _db.managers.where((m) => m.id == userId).firstOrNull;
    if (manager != null) return _managerSession(manager);

    final personal = _db.personalUsers.where((u) => u.id == userId).firstOrNull;
    if (personal != null) return _personalSession(personal);

    return null;
  }

  ///////////////////////////////////////// NEEDS QUESTION ////////////////////////////////////////
  Future<AuthSession> signUpPersonal({
    required String name,
    required String email,
    required String password,
    required String phone,
    required AddressInfo address,
  }) async {
    await _fakeDelay();

    // Every check runs before anything is written.
    if (_emailTaken(email)) throw const AuthException(AuthError.emailTaken);
    if (!_isServedPersonalAddress(address)) {
      throw const AuthException(AuthError.outsideServiceArea);
    }
    // } if (address.city != personalCity ||
    //     !alexandriaAreas.contains(address.area)) {
    //   throw const AuthException(AuthError.outsideServiceArea);
    // }

    final user = PersonalUser(
      id: _newId('PU'),
      name: name.trim(),
      email: email.trim(),
      password: password,
      phone: phone.trim(),
      address: address.copyWith(label: address.label.trim()),
    );
    _db.personalUsers.add(user);
    return _personalSession(user);
  }

  //////////////////////////////////////////////////////////////
  /// Creates the manager, the trademark and its main branch together.
  /// The signer becomes the trademark admin, so they are not added to
  /// the branch's `managerIds`.
  Future<AuthSession> signUpBusiness({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String trademarkName,
    required String branchName,
    required DeliveryLocationInfo branchLocation,
  }) async {
    await _fakeDelay();

    if (_emailTaken(email)) throw const AuthException(AuthError.emailTaken);

    final managerId = _newId('MG');
    final trademarkId = _newId('TM');
    final branchId = _newId('BR');

    final manager = Manager(
      id: managerId,
      name: name.trim(),
      email: email.trim(),
      password: password,
      phone: phone.trim(),
    );
    final branch = Branch(
      id: branchId,
      trademarkId: trademarkId,
      name: branchName.trim(),
      managerIds: const [],
      location: branchLocation,
    );
    final trademark = TradeMark(
      id: trademarkId,
      name: trademarkName.trim(),
      mainBranchId: branchId,
      trademarkAdminId: managerId,
      trademarkManagersIds: const [],
      createdAt: DateTime.now(),
      boxesStatus: false,
      taxesStatus: false,
    );

    _db.managers.add(manager);
    _db.branches.add(branch);
    _db.trademarks.add(trademark);
    return _managerSession(manager);
  }

  /// Sets (or replaces) the manager's personal location.
  /// Used right after signup or later from the delivery modal.
  Future<ManagerSession> setManagerPersonalLocation({
    required String managerId,
    required DeliveryLocationInfo location,
  }) async {
    await _fakeDelay();

    final index = _db.managers.indexWhere((m) => m.id == managerId);
    if (index == -1) throw const AuthException(AuthError.userNotFound);

    final old = _db.managers[index];
    final updated = Manager(
      id: old.id,
      name: old.name,
      email: old.email,
      password: old.password,
      phone: old.phone,
      address: location.copyWith(
        address: location.address.copyWith(
          label: location.address.label.trim(),
        ),
      ),
    );
    _db.managers[index] = updated; // replace, never mutate
    return _managerSession(updated);
  }

  bool _emailTakenByOther(String email, String userId) {
    final key = _key(email);
    return _db.managers.any((m) => m.id != userId && _key(m.email) == key) ||
        _db.personalUsers.any((u) => u.id != userId && _key(u.email) == key);
  }

  /// Updates the name, email and/or phone of a signed-in user (manager or
  /// personal). Only the given fields change. Returns the refreshed session.
  Future<AuthSession> updateProfile({
    required String userId,
    String? name,
    String? email,
    String? phone,
    DeliveryLocationInfo? address,
    AddressInfo? persoanlUserAdress,
  }) async {
    await _fakeDelay();

    if (email != null && _emailTakenByOther(email, userId)) {
      throw const AuthException(AuthError.emailTaken);
    }
    if (persoanlUserAdress != null &&
        !_isServedPersonalAddress(persoanlUserAdress)) {
      throw const AuthException(AuthError.outsideServiceArea);
    }

    final managerIndex = _db.managers.indexWhere((m) => m.id == userId);
    if (managerIndex != -1) {
      final old = _db.managers[managerIndex];
      final updated = Manager(
        id: old.id,
        password: old.password,
        name: name?.trim() ?? old.name,
        email: email?.trim() ?? old.email,
        phone: phone?.trim() ?? old.phone,
        address: address ?? old.address,
      );
      _db.managers[managerIndex] = updated; // replace, never mutate
      return _managerSession(updated);
    }

    final personalIndex = _db.personalUsers.indexWhere((u) => u.id == userId);
    if (personalIndex != -1) {
      final old = _db.personalUsers[personalIndex];
      final updated = PersonalUser(
        id: old.id,
        name: name?.trim() ?? old.name,
        email: email?.trim() ?? old.email,
        password: old.password,
        phone: phone?.trim() ?? old.phone,
        address: persoanlUserAdress ?? old.address,
      );
      _db.personalUsers[personalIndex] = updated;
      return _personalSession(updated);
    }

    throw const AuthException(AuthError.userNotFound);
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepository(ref.watch(fakeDatabaseProvider));

bool _isServedPersonalAddress(AddressInfo a) =>
    a.city == personalCity && alexandriaAreas.contains(a.area);
