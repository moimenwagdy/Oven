// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_branch_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewBranchRequestFormNotifier)
const newBranchRequestFormProvider = NewBranchRequestFormNotifierProvider._();

final class NewBranchRequestFormNotifierProvider
    extends
        $NotifierProvider<
          NewBranchRequestFormNotifier,
          NewBranchRequestFormState
        > {
  const NewBranchRequestFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newBranchRequestFormProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newBranchRequestFormNotifierHash();

  @$internal
  @override
  NewBranchRequestFormNotifier create() => NewBranchRequestFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewBranchRequestFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewBranchRequestFormState>(value),
    );
  }
}

String _$newBranchRequestFormNotifierHash() =>
    r'02a5b24f2809e0bba3bd705f316cba5bfea32abc';

abstract class _$NewBranchRequestFormNotifier
    extends $Notifier<NewBranchRequestFormState> {
  NewBranchRequestFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<NewBranchRequestFormState, NewBranchRequestFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NewBranchRequestFormState, NewBranchRequestFormState>,
              NewBranchRequestFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
