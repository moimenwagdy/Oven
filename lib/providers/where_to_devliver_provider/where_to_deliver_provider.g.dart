// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'where_to_deliver_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Which address the user picked as their delivery default.
/// Stored as a stable id ('branch' / 'owner'), never as formatted text,
/// so an edited address is reflected immediately instead of the
/// selection silently going stale.

@ProviderFor(RadioList)
const radioListProvider = RadioListProvider._();

/// Which address the user picked as their delivery default.
/// Stored as a stable id ('branch' / 'owner'), never as formatted text,
/// so an edited address is reflected immediately instead of the
/// selection silently going stale.
final class RadioListProvider extends $NotifierProvider<RadioList, String?> {
  /// Which address the user picked as their delivery default.
  /// Stored as a stable id ('branch' / 'owner'), never as formatted text,
  /// so an edited address is reflected immediately instead of the
  /// selection silently going stale.
  const RadioListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'radioListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$radioListHash();

  @$internal
  @override
  RadioList create() => RadioList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$radioListHash() => r'1a023bfd0770ee6129af18f2b26332a1ba5fb597';

/// Which address the user picked as their delivery default.
/// Stored as a stable id ('branch' / 'owner'), never as formatted text,
/// so an edited address is reflected immediately instead of the
/// selection silently going stale.

abstract class _$RadioList extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
