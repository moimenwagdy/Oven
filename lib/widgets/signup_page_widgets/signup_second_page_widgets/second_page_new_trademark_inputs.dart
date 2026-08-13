import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';

class SecondPageNewMerchantInputs extends StatefulWidget {
  const SecondPageNewMerchantInputs({super.key});

  @override
  State<SecondPageNewMerchantInputs> createState() =>
      _SecondPageNewMerchantInputsState();
}

class _SecondPageNewMerchantInputsState
    extends State<SecondPageNewMerchantInputs> {
  final _trademarkNameController = TextEditingController();
  final _branchNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _branchAddressController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _trademarkNameController.dispose();
    _branchNameController.dispose();
    _cityController.dispose();
    _branchAddressController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSignupLoginInputAndLabel(
          controller: _trademarkNameController,
          label: context.l10n.merchantName,
          placeholder: context.l10n.enterMerchantName,
          type: TextInputType.text,
          validator: (value) => (value == null || value.isEmpty)
              ? context.l10n.enterMerchantName
              : null,
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
          controller: _branchNameController,
          label: context.l10n.branchName,
          placeholder: context.l10n.enterUserName,
          type: TextInputType.text,
          validator: (value) =>
              (value == null || value.isEmpty) ? context.l10n.branchName : null,
        ),
        CustomSignupLoginInputAndLabel(
          controller: _cityController,
          label: context.l10n.city,
          placeholder: context.l10n.enterCity,
          type: TextInputType.text,
          validator: (value) =>
              (value == null || value.isEmpty) ? context.l10n.city : null,
        ),
        CustomSignupLoginInputAndLabel(
          controller: _branchAddressController,
          label: context.l10n.address,
          placeholder: context.l10n.enterAddress,
          type: TextInputType.text,
          validator: (value) =>
              (value == null || value.isEmpty) ? context.l10n.address : null,
        ),
        CustomSignupLoginInputAndLabel(
          controller: _locationController,
          label: "Location",
          placeholder: "Enter Your Location",
          type: TextInputType.text,
          validator: (value) =>
              (value == null || value.isEmpty) ? "enter your location" : null,
        ),
      ],
    );
  }
}
