// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_signup_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PersonalSignupNotifier)
const personalSignupProvider = PersonalSignupNotifierProvider._();

final class PersonalSignupNotifierProvider
    extends $NotifierProvider<PersonalSignupNotifier, PersonalSignupState> {
  const PersonalSignupNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalSignupProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalSignupNotifierHash();

  @$internal
  @override
  PersonalSignupNotifier create() => PersonalSignupNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonalSignupState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonalSignupState>(value),
    );
  }
}

String _$personalSignupNotifierHash() =>
    r'85c4cf0a483c936cdd9ae15f47a6e8c2acaca8c0';

abstract class _$PersonalSignupNotifier extends $Notifier<PersonalSignupState> {
  PersonalSignupState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PersonalSignupState, PersonalSignupState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PersonalSignupState, PersonalSignupState>,
              PersonalSignupState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
