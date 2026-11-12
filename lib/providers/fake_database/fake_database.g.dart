// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fakeDatabase)
const fakeDatabaseProvider = FakeDatabaseProvider._();

final class FakeDatabaseProvider
    extends $FunctionalProvider<FakeDatabase, FakeDatabase, FakeDatabase>
    with $Provider<FakeDatabase> {
  const FakeDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fakeDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fakeDatabaseHash();

  @$internal
  @override
  $ProviderElement<FakeDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FakeDatabase create(Ref ref) {
    return fakeDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FakeDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FakeDatabase>(value),
    );
  }
}

String _$fakeDatabaseHash() => r'10127e59374727906b21a96f416ca5cf4b4b7620';
