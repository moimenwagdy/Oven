// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_adress_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditAddressForm)
const editAddressFormProvider = EditAddressFormProvider._();

final class EditAddressFormProvider
    extends $NotifierProvider<EditAddressForm, EditBusinessAddressFormState> {
  const EditAddressFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editAddressFormProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editAddressFormHash();

  @$internal
  @override
  EditAddressForm create() => EditAddressForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditBusinessAddressFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditBusinessAddressFormState>(value),
    );
  }
}

String _$editAddressFormHash() => r'f957249a25ca041b051966f767c13656038de871';

abstract class _$EditAddressForm
    extends $Notifier<EditBusinessAddressFormState> {
  EditBusinessAddressFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<EditBusinessAddressFormState, EditBusinessAddressFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                EditBusinessAddressFormState,
                EditBusinessAddressFormState
              >,
              EditBusinessAddressFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
