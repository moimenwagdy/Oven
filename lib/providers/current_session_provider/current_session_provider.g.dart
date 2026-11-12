// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the logged-in user, or null. The user id is saved on login and
/// cleared on sign out, so the session survives app restarts.

@ProviderFor(CurrentSession)
const currentSessionProvider = CurrentSessionProvider._();

/// Holds the logged-in user, or null. The user id is saved on login and
/// cleared on sign out, so the session survives app restarts.
final class CurrentSessionProvider
    extends $NotifierProvider<CurrentSession, AuthSession?> {
  /// Holds the logged-in user, or null. The user id is saved on login and
  /// cleared on sign out, so the session survives app restarts.
  const CurrentSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentSessionHash();

  @$internal
  @override
  CurrentSession create() => CurrentSession();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthSession? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthSession?>(value),
    );
  }
}

String _$currentSessionHash() => r'74efb6eb8f3fb3fa3ddc6c78bc8c30100fe20e85';

/// Holds the logged-in user, or null. The user id is saved on login and
/// cleared on sign out, so the session survives app restarts.

abstract class _$CurrentSession extends $Notifier<AuthSession?> {
  AuthSession? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthSession?, AuthSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthSession?, AuthSession?>,
              AuthSession?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Id of the logged-in user (manager or personal), or null.

@ProviderFor(currentUserId)
const currentUserIdProvider = CurrentUserIdProvider._();

/// Id of the logged-in user (manager or personal), or null.

final class CurrentUserIdProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  /// Id of the logged-in user (manager or personal), or null.
  const CurrentUserIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserIdHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentUserId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentUserIdHash() => r'bdd93f7573a299b34d3fcaac3845233fa2ef2ffb';
