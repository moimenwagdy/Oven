// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeletedManagers)
const deletedManagersProvider = DeletedManagersProvider._();

final class DeletedManagersProvider
    extends $NotifierProvider<DeletedManagers, List<String>> {
  const DeletedManagersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deletedManagersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deletedManagersHash();

  @$internal
  @override
  DeletedManagers create() => DeletedManagers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$deletedManagersHash() => r'c7c839b0ac20fe77e7643a6687e29b074dedea01';

abstract class _$DeletedManagers extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
