// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BusinessSignupNotifier)
const businessSignupProvider = BusinessSignupNotifierProvider._();

final class BusinessSignupNotifierProvider
    extends $NotifierProvider<BusinessSignupNotifier, BusinessSignupState> {
  const BusinessSignupNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'businessSignupProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$businessSignupNotifierHash();

  @$internal
  @override
  BusinessSignupNotifier create() => BusinessSignupNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BusinessSignupState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BusinessSignupState>(value),
    );
  }
}

String _$businessSignupNotifierHash() =>
    r'df33d30a9f78001cee3489a03e0898dff30b10a5';

abstract class _$BusinessSignupNotifier extends $Notifier<BusinessSignupState> {
  BusinessSignupState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BusinessSignupState, BusinessSignupState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BusinessSignupState, BusinessSignupState>,
              BusinessSignupState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
