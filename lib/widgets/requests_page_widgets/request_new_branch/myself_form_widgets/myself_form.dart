import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/myself_request%20_link_provider/myself_request_link_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/myself_form_inputs.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/myself_form_link_success_view.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/myself_form_submit_button.dart';

class MyselfForm extends ConsumerStatefulWidget {
  const MyselfForm({super.key});
  @override
  ConsumerState<MyselfForm> createState() => _MyselfFormState();
}

class _MyselfFormState extends ConsumerState<MyselfForm> {
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController managerController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    branchNameController.dispose();
    provinceController.dispose();
    addressController.dispose();
    locationController.dispose();
    managerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final submitState = ref.watch(submitMyselfFormProvider);

    return submitState.when(
      data: (data) {
        if (data.generatedLink != null) {
          return MyselfFormLinkSuccessView(link: data.generatedLink!);
        }
        if (data.submittedWithSelectedManager) {
          return Center(
            child: SizedBox(
              height: 500,
              width: context.screenWidth,
              child: Center(child: Text("Form Submitted Successfully")),
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(15.0),
          margin: EdgeInsets.all(5),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 30,
              children: [
                MyselfFormInputs(
                  branchNameController: branchNameController,
                  provinceController: provinceController,
                  addressController: addressController,
                  locationController: locationController,
                  managerController: managerController,
                ),
                MyselfFormSubmitButton(
                  addressController: addressController,
                  branchNameController: branchNameController,
                  provinceController: provinceController,
                  locationController: locationController,
                  managerController: managerController,
                ),
              ],
            ),
          ),
        ); // the form itself
      },
      loading: () {
        return SizedBox(
          height: 500,
          width: context.screenWidth,
          child: Center(child: SmallSpinner()),
        );
      },
      error: (error, stackTrace) {
        return Text("?");
      },
    );
  }
}
