// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FakeAuth)
const fakeAuthProvider = FakeAuthProvider._();

final class FakeAuthProvider
    extends $AsyncNotifierProvider<FakeAuth, FakeUser?> {
  const FakeAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fakeAuthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fakeAuthHash();

  @$internal
  @override
  FakeAuth create() => FakeAuth();
}

String _$fakeAuthHash() => r'd1570cd2e13067bd16c05204cb89cd3fd4fab1ad';

abstract class _$FakeAuth extends $AsyncNotifier<FakeUser?> {
  FutureOr<FakeUser?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<FakeUser?>, FakeUser?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FakeUser?>, FakeUser?>,
              AsyncValue<FakeUser?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
