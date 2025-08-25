import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    // final screenWidth = MediaQuery.of(fcontext).size.width;
    return Column(
      spacing: 4.h,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(context.l10n.merchantName),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterMerchantName,
              prefixIcon: Icons.shop,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(context.l10n.userName),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterUserName,
              prefixIcon: Icons.shop,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(context.l10n.phoneNumber),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterphoneNumber,
              prefixIcon: Icons.numbers,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(context.l10n.province),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterProvince,
              prefixIcon: Icons.square,
              inputType: TextInputType.text,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(context.l10n.address),
            CustomTextField(
              controller: merchantName,
              name: context.l10n.enterAddress,
              prefixIcon: Icons.streetview,
              inputType: TextInputType.text,
            ),
          ],
        ),
      ],
    );
  }
}
