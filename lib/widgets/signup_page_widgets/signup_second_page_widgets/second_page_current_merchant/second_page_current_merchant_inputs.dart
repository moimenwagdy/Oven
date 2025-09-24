import 'package:flutter/material.dart';
import 'package:oven/notifires/locale_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/custom_text_field.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_current_merchant/information_button.dart';

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
    return Column(
      spacing: 10,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              context.l10n.userName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              controller: userName,
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
              controller: phoneNumber,
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
              context.l10n.customerCode,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              width: context.isPortrait ? context.screenWidth : 400,
              child: Stack(
                children: [
                  CustomTextField(
                    controller: customerCode,
                    name: context.l10n.enterCustomerCode,
                    inputType: TextInputType.text,
                  ),
                  ValueListenableBuilder(
                    valueListenable: locale,
                    builder: (context, value, child) {
                      return Align(
                        alignment: value.toString() == "ar"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: InformationButton(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
