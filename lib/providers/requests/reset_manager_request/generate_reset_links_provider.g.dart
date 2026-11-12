// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_reset_links_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GenerateResetLinks)
const generateResetLinksProvider = GenerateResetLinksProvider._();

final class GenerateResetLinksProvider
    extends $AsyncNotifierProvider<GenerateResetLinks, void> {
  const GenerateResetLinksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generateResetLinksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generateResetLinksHash();

  @$internal
  @override
  GenerateResetLinks create() => GenerateResetLinks();
}

String _$generateResetLinksHash() =>
    r'2fded41636c21b55eca373d2f7d596716bdc0998';

abstract class _$GenerateResetLinks extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
