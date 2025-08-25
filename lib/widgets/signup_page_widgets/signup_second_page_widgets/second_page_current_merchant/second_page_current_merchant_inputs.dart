import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_text_field.dart';

class SecondPageCurrentMerchantInputs extends StatelessWidget {
  final TextEditingController customerCode;
  final TextEditingController userName;
  final TextEditingController phoneNumber;

  const SecondPageCurrentMerchantInputs({
    super.key,
    required this.customerCode,
    required this.phoneNumber,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      spacing: 4.h,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(context.l10n.userName),
            CustomTextField(
              controller: userName,
              name: context.l10n.enterUserName,
              prefixIcon: Icons.person,
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
              controller: phoneNumber,
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
            Text(context.l10n.customerCode),
            CustomTextField(
              controller: customerCode,
              name: context.l10n.enterCustomerCode,
              prefixIcon: Icons.numbers,
              inputType: TextInputType.text,
            ),
          ],
        ),
      ],
    );
  }
}
