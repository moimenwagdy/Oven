// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Profile edits for the signed-in user (manager or personal).
/// Each method returns null on success, or an error message.

@ProviderFor(ProfileActions)
const profileActionsProvider = ProfileActionsProvider._();

/// Profile edits for the signed-in user (manager or personal).
/// Each method returns null on success, or an error message.
final class ProfileActionsProvider
    extends $NotifierProvider<ProfileActions, void> {
  /// Profile edits for the signed-in user (manager or personal).
  /// Each method returns null on success, or an error message.
  const ProfileActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileActionsHash();

  @$internal
  @override
  ProfileActions create() => ProfileActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$profileActionsHash() => r'8b35a483e815b193728b5e4bb60e8a9f4614b73a';

/// Profile edits for the signed-in user (manager or personal).
/// Each method returns null on success, or an error message.

abstract class _$ProfileActions extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
