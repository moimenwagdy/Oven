import 'package:oven/providers/requests/reset_manager_request/reset_manager_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generate_reset_links_provider.g.dart';

@Riverpod(keepAlive: true)
class GenerateResetLinks extends _$GenerateResetLinks {
  @override
  FutureOr<void> build() {}

  Future<void> generate(List<String> managersIds, String branchId) async {
    final resetNotifier = ref.read(resetManagersProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final entries = await Future.wait(
        managersIds.map((id) async {
          // final link = await buildChottuShareLink(id: id);
          return (
            managerId: id,
            link: "Link PLaceholder",

            // await buildChottuShareLink(id: 'NM-$branchId'),
          );
        }),
      );
      await resetNotifier.setManagersToResetState(entries);
    });
  }
}
