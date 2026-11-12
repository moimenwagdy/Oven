// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marked_maincategory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MarkSelectedMaincategory)
const markSelectedMaincategoryProvider = MarkSelectedMaincategoryProvider._();

final class MarkSelectedMaincategoryProvider
    extends $NotifierProvider<MarkSelectedMaincategory, List<String>> {
  const MarkSelectedMaincategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markSelectedMaincategoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markSelectedMaincategoryHash();

  @$internal
  @override
  MarkSelectedMaincategory create() => MarkSelectedMaincategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$markSelectedMaincategoryHash() =>
    r'19f241645247769ef480796b711e5e8b719e0401';

abstract class _$MarkSelectedMaincategory extends $Notifier<List<String>> {
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
