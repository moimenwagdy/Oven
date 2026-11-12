// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Branches)
const branchesProvider = BranchesProvider._();

final class BranchesProvider extends $NotifierProvider<Branches, List<Branch>> {
  const BranchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchesHash();

  @$internal
  @override
  Branches create() => Branches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Branch> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Branch>>(value),
    );
  }
}

String _$branchesHash() => r'a0cc7abe17d16010f53eac6a76d08477ab1ab37e';

abstract class _$Branches extends $Notifier<List<Branch>> {
  List<Branch> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Branch>, List<Branch>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Branch>, List<Branch>>,
              List<Branch>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
