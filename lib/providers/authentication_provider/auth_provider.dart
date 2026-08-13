import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

/// Simple test-only user model.
class FakeUser {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String address;
  final String trademarkId;
  final String branchId;
  final String branchAddress;
  final String location;

  const FakeUser({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.trademarkId,
    required this.branchId,
    required this.branchAddress,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'name': name,
    'phone': phone,
    'address': address,
    'trademarkId': trademarkId,
    'branchId': branchId,
    'branchAddress': branchAddress,
    'location': location,
  };

  factory FakeUser.fromJson(Map<String, dynamic> json) => FakeUser(
    email: json['email'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
    trademarkId: json['trademarkId'] as String,
    branchId: json['branchId'] as String,
    branchAddress: json['branchAddress'] as String,
    location: json['location'] as String,
  );
}

const _kLoggedInUserKey = 'fake_auth_logged_in_user';

@Riverpod(keepAlive: true)
class FakeAuth extends _$FakeAuth {
  /// In-memory "database" of signed-up users.
  /// Seeded on first build, mutated by signUp().
  /// Lost on app restart by design (point 3) — never written to disk.
  final List<FakeUser> _users = [
    const FakeUser(
      email: 'mostafa@gmail.com',
      password: '123456',
      name: 'Mostafa Gaaboba',
      phone: '01000000000',
      address: '12 Test Street, Alexandria',
      trademarkId: 'TM-001',
      branchId: 'BR-001',
      branchAddress: '5 Branch Road, Alexandria',
      location: 'Alexandria - Downtown',
    ),
    const FakeUser(
      email: 'omar@gmail.com',
      password: '123456',
      name: 'Omar Elramly',
      phone: '01111111111',
      address: '99 Admin Ave, Cairo',
      trademarkId: 'TM-002',
      branchId: 'BR-002',
      branchAddress: '10 HQ Street, Cairo',
      location: 'Cairo - Nasr City',
    ),
  ];

  @override
  FutureOr<FakeUser?> build() async {
    return _restoreSession();
  }

  /// Checks SharedPreferences for a previously logged-in user and,
  /// if their email still matches a known user, restores that session.
  Future<FakeUser?> _restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedJson = prefs.getString(_kLoggedInUserKey);
    if (savedJson == null) return null;

    final savedUser = FakeUser.fromJson(
      jsonDecode(savedJson) as Map<String, dynamic>,
    );

    // If the user only exists because of a runtime signUp() and the app
    // was killed and relaunched, _users is reseeded without them, so this
    // correctly falls back to null (logged out) — matches point 3.
    final stillExists = _users.any((u) => u.email == savedUser.email);
    return stillExists ? savedUser : null;
  }

  Future<void> _persistUser(FakeUser user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLoggedInUserKey, jsonEncode(user.toJson()));
  }

  /// Attempts to sign in against the in-memory user list.
  /// Only email + password are checked; the full matched user record
  /// (including phone/address/trademark/branch/location) is saved.
  /// Returns true on success.
  Future<bool> signIn({required String email, required String password}) async {
    await future;
    final match = _users
        .where((u) => u.email == email && u.password == password)
        .firstOrNull;

    if (match == null) return false;

    state = AsyncData(match);
    await _persistUser(match);

    return true;
  }

  /// Adds a new user to the in-memory list and logs them in.
  /// Returns false if the email is already taken.
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
    required String trademarkId,
    required String branchId,
    required String branchAddress,
    required String location,
  }) async {
    await future;
    print("Signup email = $email");

    final exists = _users.any((u) => u.email == email);

    print("exists = $exists");

    if (exists) return false;

    final newUser = FakeUser(
      email: email,
      password: password,
      name: name,
      phone: phone,
      address: address,
      trademarkId: trademarkId,
      branchId: branchId,
      branchAddress: branchAddress,
      location: location,
    );
    _users.add(newUser);

    state = AsyncData(newUser);
    await _persistUser(newUser);

    return true;
  }

  Future<void> signOut() async {
    await future;
    state = const AsyncData(null);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kLoggedInUserKey);
  }
}
