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
    r'594b3249568eaec14f2e332140f0151c2ab4d53a';

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
