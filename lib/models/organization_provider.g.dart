// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(organizationRepository)
const organizationRepositoryProvider = OrganizationRepositoryProvider._();

final class OrganizationRepositoryProvider
    extends
        $FunctionalProvider<
          OrganizationRepository,
          OrganizationRepository,
          OrganizationRepository
        >
    with $Provider<OrganizationRepository> {
  const OrganizationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'organizationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$organizationRepositoryHash();

  @$internal
  @override
  $ProviderElement<OrganizationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OrganizationRepository create(Ref ref) {
    return organizationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrganizationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrganizationRepository>(value),
    );
  }
}

String _$organizationRepositoryHash() =>
    r'c8352613d6e077c0e8091bd5aa24d8f75cdc186b';
