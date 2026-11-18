import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/pages/account_pages/map_page.dart';
import 'package:oven/providers/create_new_branch_request_provider/new_branch_form_notifier.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_text_field.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/managers_dropdown.dart';

class MyselfFormInputs extends ConsumerStatefulWidget {
  final TextEditingController managerController;
  const MyselfFormInputs({super.key, required this.managerController});

  @override
  ConsumerState<MyselfFormInputs> createState() => _MyselfFormInputsState();
}

class _MyselfFormInputsState extends ConsumerState<MyselfFormInputs> {
  final branchNameController = TextEditingController();
  final locationController = TextEditingController();
  @override
  void initState() {
    super.initState();

    final formState = ref.read(newBranchRequestFormProvider);
    branchNameController.text = formState.branchName;
    if (formState.location.latitude != null &&
        formState.location.longitude != null) {
      locationController.text = "Location is entered";
    }
  }

  @override
  Widget build(BuildContext context) {
    final formStateValid = ref
        .read(newBranchRequestFormProvider.notifier)
        .allStateIsValid();

    return Column(
      spacing: 10,
      children: [
        CustomSignupLoginInputAndLabel(
          controller: branchNameController,
          label: context.l10n.branchName,
          placeholder: context.l10n.enterBrnachName,
          type: TextInputType.text,
          onChanged: (value) => ref
              .read(newBranchRequestFormProvider.notifier)
              .setBranchName(value),
          validator: (value) => Validators.validateIsNotEmpty(value),
        ),
        CustomTextField(
          validator: (p0) =>
              formStateValid ? null : "Please enter your location",
          controller: locationController,
          name: formStateValid ? "Location Entered" : "Enter your location",
          inputType: TextInputType.text,
          onFocus: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) {
                return Column(
                  children: [
                    MapPage(
                      onCameraMove: (location) {
                        ref
                            .read(newBranchRequestFormProvider.notifier)
                            .setLocation(
                              latitude: location.latitude,
                              longitude: location.longitude,
                            );
                        print(location.latitude.toString());
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      margin: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 20,
                      ),
                      child: FormSubmitButtom(
                        textChild: Text(
                          "Select this location",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: onPrimary),
                        ),
                        onPressed: () {
                          context.goNamed("mySelfAddressInfo");
                          context.pop();
                          // notifier.setAddress();
                          // ref.read(navigationIndexProvider.notifier).setNavigationIndex(5);
                          // shell.goBranch(5, initialLocation: true);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
          suffix: formStateValid
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.check_circle, color: Colors.green),
                )
              : null,
        ),
        Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Text(
                  "Select Manager",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            CustomTextField(
              controller: widget.managerController,
              inputType: TextInputType.text,
              name: "Select Manager",
              onFocus: () async {
                final manager = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ManagersDropdown(
                      managerController: widget.managerController,
                    ),
                  ),
                );
                if (manager != null) {
                  widget.managerController.text = manager.name;
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
