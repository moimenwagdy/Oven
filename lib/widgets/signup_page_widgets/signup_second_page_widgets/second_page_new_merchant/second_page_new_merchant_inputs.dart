import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_text_field.dart';

class SecondPageNewMerchantInputs extends StatelessWidget {
  final TextEditingController merchantName;
  final TextEditingController phoneNumber;
  final TextEditingController province;
  final TextEditingController address;
  final TextEditingController userName;

  const SecondPageNewMerchantInputs({
    super.key,
    required this.merchantName,
    required this.phoneNumber,
    required this.province,
    required this.address,
    required this.userName,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.merchantName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterMerchantName,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.userName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterUserName,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.phoneNumber,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterphoneNumber,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.city,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterCity,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.address,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterAddress,
              inputType: TextInputType.text,
            ),
          ],
        ),
      ],
    );
  }
}
