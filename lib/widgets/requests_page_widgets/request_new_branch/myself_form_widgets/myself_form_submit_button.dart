import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/myself_request%20_link_provider/myself_request_link_provider.dart';
import 'package:oven/utils/helpers/fake_current_manager_branch_data.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

const inviteNewManagerLabel = "Invite New Manager";

class MyselfFormSubmitButton extends ConsumerWidget {
  final TextEditingController branchNameController;
  final TextEditingController provinceController;
  final TextEditingController addressController;
  final TextEditingController locationController;
  final TextEditingController managerController;
  const MyselfFormSubmitButton({
    super.key,
    required this.addressController,
    required this.branchNameController,
    required this.provinceController,
    required this.locationController,
    required this.managerController,
  });

  void _handleSubmit(WidgetRef ref) {
    if (managerController.text.isEmpty) return;

    if (managerController.text == inviteNewManagerLabel) {
      //  final currentData = currentFakeData;
      // {currentData.currentTrademarkId}${currentData.currentManagerId}
      ref
          .read(submitMyselfFormProvider.notifier)
          .generateLink("endarabna bory");
    } else {
      ref
          .read(submitMyselfFormProvider.notifier)
          .submitSelectedManager("endarabna bory");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkState = ref.watch(submitMyselfFormProvider);
    return Column(
      children: [
        SizedBox(
          width: 150,
          height: 50,
          child: FormSubmitButtom(
            textChild: linkState.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    "Ok",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
            onPressed: linkState.isLoading ? null : () => _handleSubmit(ref),
          ),
        ),
      ],
    );
  }
}
