import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_text_field.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/managers_dropdown.dart';

class MyselfFormInputs extends StatelessWidget {
  final TextEditingController branchNameController;
  final TextEditingController provinceController;
  final TextEditingController addressController;
  final TextEditingController locationController;
  final TextEditingController managerController;
  const MyselfFormInputs({
    super.key,
    required this.branchNameController,
    required this.provinceController,
    required this.addressController,
    required this.locationController,
    required this.managerController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CustomSignupLoginInputAndLabel(
          controller: branchNameController,
          label: context.l10n.branchName,
          placeholder: context.l10n.enterBrnachName,
          type: TextInputType.text,
        ),
        CustomTextField(
          controller: TextEditingController(),
          name: "Enter your location",
          inputType: TextInputType.text,
          onFocus: () => context.go("/home"),
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
              controller: managerController,
              inputType: TextInputType.text,
              name: "Select Manager",
              onFocus: () async {
                final manager = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ManagersDropdown(managerController: managerController),
                  ),
                );
                if (manager != null) {
                  managerController.text = manager.name;
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
