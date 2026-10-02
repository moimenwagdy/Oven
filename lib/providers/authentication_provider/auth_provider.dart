import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oven/providers/signup_providers/personal_signup_provider/personal_signup_state.dart';
import 'package:oven/providers/signup_providers/bussines_signup_form_state_provider/signup_form_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

enum LoggerState { personal, business }

/// Simple test-only user model. Sealed so personal and business users
/// each only carry the fields that actually apply to them — no nullable
/// trademarkId on a personal account, no empty city on a personal address.
sealed class FakeUser {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;

  const FakeUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  LoggerState get loggerState;

  Map<String, dynamic> toJson();

  factory FakeUser.fromJson(Map<String, dynamic> json) {
    final logger = LoggerState.values.byName(json['loggerState'] as String);
    return switch (logger) {
      LoggerState.personal => PersonalFakeUser.fromJson(json),
      LoggerState.business => BusinessFakeUser.fromJson(json),
    };
  }
}

class PersonalFakeUser extends FakeUser {
  final PersonalAddressInfo address;

  const PersonalFakeUser({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.phone,
    required this.address,
  });

  @override
  LoggerState get loggerState => LoggerState.personal;

  @override
  Map<String, dynamic> toJson() => {
    'loggerState': loggerState.name,
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'address': {
      'area': address.area,
      'street': address.street,
      'building': address.building,
      'floor': address.floor,
      'flat': address.flat,
      'details': address.details,
    },
  };

  factory PersonalFakeUser.fromJson(Map<String, dynamic> json) {
    final addr = json['address'] as Map<String, dynamic>;
    return PersonalFakeUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      address: PersonalAddressInfo(
        area: addr['area'] as String? ?? '',
        street: addr['street'] as String? ?? '',
        building: addr['building'] as String? ?? '',
        floor: addr['floor'] as String? ?? '',
        flat: addr['flat'] as String? ?? '',
        details: addr['details'] as String? ?? '',
      ),
    );
  }
}

class BusinessFakeUser extends FakeUser {
  final String trademarkId;
  final String branchId;
  // Branch location & address (collected during signup, required).
  final double latitude;
  final double longitude;
  final AddressInfo address;

  // Owner's personal location & address (collected as an optional,
  // skippable step *after* signup). Null until the owner sets it.
  final double? ownerLatitude;
  final double? ownerLongitude;
  final AddressInfo? ownerAddress;

  const BusinessFakeUser({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.phone,
    required this.trademarkId,
    required this.branchId,
    required this.latitude,
    required this.longitude,
    required this.address,
    this.ownerLatitude,
    this.ownerLongitude,
    this.ownerAddress,
  });

  @override
  LoggerState get loggerState => LoggerState.business;

  /// Returns a copy with the owner's location/address filled in.
  /// Everything else (branch data, credentials) is carried over as-is.
  BusinessFakeUser copyWithOwnerLocation({
    required double latitude,
    required double longitude,
    required AddressInfo address,
  }) {
    return BusinessFakeUser(
      id: id,
      name: name,
      email: email,
      password: password,
      phone: phone,
      trademarkId: trademarkId,
      branchId: branchId,
      latitude: this.latitude,
      longitude: this.longitude,
      address: this.address,
      ownerLatitude: latitude,
      ownerLongitude: longitude,
      ownerAddress: address,
    );
  }

  bool get hasOwnerLocation => ownerLatitude != null && ownerLongitude != null;

  @override
  Map<String, dynamic> toJson() => {
    'loggerState': loggerState.name,
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'trademarkId': trademarkId,
    'branchId': branchId,
    'latitude': latitude,
    'longitude': longitude,
    'address': {
      'city': address.city,
      'area': address.area,
      'street': address.street,
      'building': address.building,
      'floor': address.floor,
      'flat': address.flat,
      'details': address.details,
    },
    'ownerLatitude': ownerLatitude,
    'ownerLongitude': ownerLongitude,
    'ownerAddress': ownerAddress == null
        ? null
        : {
            'city': ownerAddress!.city,
            'area': ownerAddress!.area,
            'street': ownerAddress!.street,
            'building': ownerAddress!.building,
            'floor': ownerAddress!.floor,
            'flat': ownerAddress!.flat,
            'details': ownerAddress!.details,
          },
  };

  factory BusinessFakeUser.fromJson(Map<String, dynamic> json) {
    final addr = json['address'] as Map<String, dynamic>;
    final ownerAddr = json['ownerAddress'] as Map<String, dynamic>?;

    return BusinessFakeUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      trademarkId: json['trademarkId'] as String,
      branchId: json['branchId'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: AddressInfo(
        city: addr['city'] as String? ?? '',
        area: addr['area'] as String? ?? '',
        street: addr['street'] as String? ?? '',
        building: addr['building'] as String? ?? '',
        floor: addr['floor'] as String? ?? '',
        flat: addr['flat'] as String? ?? '',
        details: addr['details'] as String? ?? '',
      ),
      ownerLatitude: (json['ownerLatitude'] as num?)?.toDouble(),
      ownerLongitude: (json['ownerLongitude'] as num?)?.toDouble(),
      ownerAddress: ownerAddr == null
          ? null
          : AddressInfo(
              city: ownerAddr['city'] as String? ?? '',
              area: ownerAddr['area'] as String? ?? '',
              street: ownerAddr['street'] as String? ?? '',
              building: ownerAddr['building'] as String? ?? '',
              floor: ownerAddr['floor'] as String? ?? '',
              flat: ownerAddr['flat'] as String? ?? '',
              details: ownerAddr['details'] as String? ?? '',
            ),
    );
  }
}

const _kUsersKey = 'fake_auth_users';
const _kSessionUserIdKey = 'fake_auth_session_user_id';

@Riverpod(keepAlive: true)
class FakeAuth extends _$FakeAuth {
  /// In-memory copy of the "database" of users.
  /// Seeded on first run, then loaded from SharedPreferences on every
  /// build(). Mutated by signUp()/updateOwnerLocation(), and written back
  /// to disk after each mutation.
  final List<FakeUser> _users = [
    const BusinessFakeUser(
      id: 'seed-001',
      email: 'mostafa@gmail.com',
      password: '123456',
      name: 'Mostafa Gaaboba',
      phone: '01000000000',
      trademarkId: 'TM-001',
      branchId: 'BR-001',
      address: AddressInfo(
        area: "Akher EL-Helw",
        city: "Tanta",
        street: "Imam mouslim",
        building: "12",
        floor: "4",
        flat: "1",
        details: "",
      ),
      latitude: 21.1163123,
      longitude: 0.16165111,
      ownerAddress: AddressInfo(
        area: "Akher EL-b7r",
        city: "Tanta",
        street: "Elnahas St",
        building: "12",
        floor: "4",
        flat: "1",
        details: "",
      ),
      ownerLatitude: 0.5461561,
      ownerLongitude: 0.511651,
    ),
    const BusinessFakeUser(
      id: 'seed-002',
      email: 'omar@gmail.com',
      password: '123456',
      name: 'Omar Elramly',
      phone: '01111111111',
      trademarkId: 'TM-002',
      branchId: 'BR-002',
      address: AddressInfo(
        area: "Elraml",
        city: "Alexandria",
        street: "kopry elawayed",
        building: "15",
        floor: "10",
        flat: "11",
        details: "call when arrive",
      ),
      latitude: 0.151631631,
      longitude: 0.33136116,
      ownerAddress: null,
      ownerLatitude: null,
      ownerLongitude: null,
    ),
  ];

  /// Test-only unique id generator. Fine for a fake in-memory store;
  /// replace with whatever the real backend returns once there is one.
  /// Test-only unique id generator. Fine for a fake store;
  /// replace with whatever the real backend returns once there is one.
  String _generateId() => 'user-${DateTime.now().microsecondsSinceEpoch}';

  @override
  FutureOr<FakeUser?> build() async {
    await _loadUsers();
    return _restoreSession();
  }

  /// Loads the persisted users list. On first run (nothing saved yet) the
  /// seed users are written to disk. If the saved data is corrupt or the
  /// schema changed, falls back to the seeds and clears the session.
  Future<void> _loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_kUsersKey);

    if (raw == null) {
      await _persistUsers();
      return;
    }

    try {
      final loaded = raw
          .map((s) => FakeUser.fromJson(jsonDecode(s) as Map<String, dynamic>))
          .toList();
      _users
        ..clear()
        ..addAll(loaded);
    } catch (e, st) {
      debugPrint('Failed to load users, resetting to seeds: $e\n$st');
      await prefs.remove(_kSessionUserIdKey);
      await _persistUsers();
    }
  }

  Future<void> _persistUsers() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _kUsersKey,
      _users.map((u) => jsonEncode(u.toJson())).toList(),
    );
  }

  Future<FakeUser?> _restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(_kSessionUserIdKey);
    if (userId == null) return null;

    final user = _users.where((u) => u.id == userId).firstOrNull;
    if (user == null) {
      await prefs.remove(_kSessionUserIdKey);
    }
    return user;
  }

  Future<void> _persistSession(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kSessionUserIdKey, userId);
  }

  /// Attempts to sign in against the user list.
  /// Returns true on success. The stored user's `loggerState`
  /// tells the caller whether it's a personal or business account.
  Future<bool> signIn({required String email, required String password}) async {
    await future;
    final match = _users
        .where((u) => u.email == email && u.password == password)
        .firstOrNull;
    if (match == null) return false;
    await _persistSession(match.id);
    state = AsyncData(match);
    return true;
  }

  /// Single signup entry point for BOTH personal and business accounts.
  /// The caller builds the right variant (PersonalFakeUser or
  /// BusinessFakeUser) with `id` left blank — this assigns the real id.
  /// Returns false if the email is already taken.
  Future<bool> signUp(FakeUser newUser) async {
    await future;
    final exists = _users.any((u) => u.email == newUser.email);
    if (exists) return false;

    final withId = switch (newUser) {
      PersonalFakeUser u => PersonalFakeUser(
        id: _generateId(),
        name: u.name,
        email: u.email,
        password: u.password,
        phone: u.phone,
        address: u.address,
      ),
      BusinessFakeUser u => BusinessFakeUser(
        id: _generateId(),
        name: u.name,
        email: u.email,
        password: u.password,
        phone: u.phone,
        trademarkId: u.trademarkId,
        branchId: u.branchId,
        latitude: u.latitude,
        longitude: u.longitude,
        address: u.address,
      ),
    };

    _users.add(withId);
    await _persistUsers();
    await _persistSession(withId.id);
    state = AsyncData(withId);
    return true;
  }

  /// Fills in the owner's personal location/address on an already
  /// signed-up business user, found by `userId`. Business flow only —
  /// this step is skippable, and can also be done later from a
  /// "complete your profile" screen, not just right after signup.
  /// Returns false if `userId` doesn't belong to a business user.
  Future<bool> updateOwnerLocation({
    required String userId,
    required double latitude,
    required double longitude,
    required AddressInfo address,
  }) async {
    await future;

    final index = _users.indexWhere((u) => u.id == userId);
    if (index == -1) return false;

    final existing = _users[index];
    if (existing is! BusinessFakeUser) return false;

    final updated = existing.copyWithOwnerLocation(
      latitude: latitude,
      longitude: longitude,
      address: address,
    );

    _users[index] = updated;
    // Always persist the users list, even if this isn't the logged-in user.
    await _persistUsers();

    // Keep the active session in sync if this is the logged-in user.
    if (state.value?.id == userId) {
      state = AsyncData(updated);
    }

    return true;
  }

  /// Clears the session only. Registered users stay saved.
  Future<void> signOut() async {
    await future;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kSessionUserIdKey);
    state = const AsyncData(null);
  }
}
