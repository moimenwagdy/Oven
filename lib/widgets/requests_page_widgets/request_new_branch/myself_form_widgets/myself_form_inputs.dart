import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
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
          placeholder: context.l10n.enterUserName,
          type: TextInputType.text,
        ),
        CustomSignupLoginInputAndLabel(
          controller: provinceController,
          label: context.l10n.city,
          placeholder: context.l10n.enterCity,
          type: TextInputType.text,
        ),

        CustomSignupLoginInputAndLabel(
          controller: addressController,
          label: context.l10n.address,
          placeholder: context.l10n.enterAddress,
          type: TextInputType.text,
        ),
        CustomSignupLoginInputAndLabel(
          controller: locationController,
          label: "Location",
          placeholder: "Enter Your Location",
          type: TextInputType.text,
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

        // onFocus: () async {
        //   await showDialog(
        //     context: context,
        //     builder: (context) {
        //       return Dialog(
        //         constraints: BoxConstraints(
        //           minHeight: context.screenHeight * .70,
        //           minWidth: context.screenWidth,
        //         ),
        //         backgroundColor: Colors.transparent,
        //         child: ManagersDropdown(managerController: managerController),
        //       );
        //     },
        //   );
        //   print("hola hola");
        // },
      ],
    );
  }
}
