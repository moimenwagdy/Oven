import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oven/utils/helpers/fake_current_manager_branch_data.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/function.dart';
part 'other_person_request_link_provider.g.dart';

@riverpod
class GenerateOtherPersonLink extends _$GenerateOtherPersonLink {
  @override
  AsyncValue<String?> build() {
    return const AsyncData(null);
  }

  Future<void> generateLink(String payload) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final currentData = currentFakeData;
      final newId =
          "NM-${currentData.currentTrademarkId}${currentData.currentManagerId}";
      final link = await buildChottuShareLink(id: newId);
      return link;
    });
  }
}
