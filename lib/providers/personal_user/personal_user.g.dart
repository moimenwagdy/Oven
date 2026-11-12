// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PersonalUsers)
const personalUsersProvider = PersonalUsersProvider._();

final class PersonalUsersProvider
    extends $NotifierProvider<PersonalUsers, List<PersonalUser>> {
  const PersonalUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalUsersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalUsersHash();

  @$internal
  @override
  PersonalUsers create() => PersonalUsers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PersonalUser> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PersonalUser>>(value),
    );
  }
}

String _$personalUsersHash() => r'a3f870e5b1fbb02ebe841e27ada5fb2b54c84ccb';

abstract class _$PersonalUsers extends $Notifier<List<PersonalUser>> {
  List<PersonalUser> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<PersonalUser>, List<PersonalUser>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<PersonalUser>, List<PersonalUser>>,
              List<PersonalUser>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
