import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oven/utils/helpers/fake_current_manager_branch_data.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/function.dart';
part 'myself_request_link_provider.g.dart';

class SubmitState {
  const SubmitState({
    this.generatedLink,
    required this.submittedWithSelectedManager,
  });

  final String? generatedLink;
  final bool submittedWithSelectedManager;

  static const initial = SubmitState(
    generatedLink: null,
    submittedWithSelectedManager: false,
  );
}

@riverpod
class SubmitMyselfForm extends _$SubmitMyselfForm {
  @override
  AsyncValue<SubmitState> build() {
    return const AsyncData(SubmitState.initial);
  }

  Future<void> generateLink(String payload) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final newId = "NM-$payload";
      final link = await buildChottuShareLink(id: newId);
      return SubmitState(
        generatedLink: link,
        submittedWithSelectedManager: false,
      );
    });
  }

  Future<void> submitSelectedManager(String payload) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: actual submission call once backend/payload shape is confirmed
      return const SubmitState(
        generatedLink: null,
        submittedWithSelectedManager: true,
      );
    });
  }
}
