import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';

class ExternalSignupSecondPageInputs extends StatelessWidget {
  final TextEditingController trademarkNameController;
  final TextEditingController branchNameController;
  final TextEditingController provinceController;
  final TextEditingController addressController;
  final TextEditingController locationController;

  const ExternalSignupSecondPageInputs({
    super.key,
    required this.trademarkNameController,
    required this.branchNameController,
    required this.provinceController,
    required this.addressController,
    required this.locationController,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CustomSignupLoginInputAndLabel(
          controller: trademarkNameController,
          label: context.l10n.merchantName,
          placeholder: context.l10n.enterMerchantName,
          type: TextInputType.text,
        ),
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Container(
              height: 4,
              width: context.screenWidth * .8,
              color: Theme.of(context).colorScheme.primary,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Theme.of(context).colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text("Branch Information"),
            ),
          ],
        ),
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
      ],
    );
  }
}
