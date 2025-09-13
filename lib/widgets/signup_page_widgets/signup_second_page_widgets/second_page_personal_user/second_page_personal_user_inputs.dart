import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom%20widgets/custom_text_field.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_personal_user/second_page_personal_user_areas_input.dart';

class SecondPagePersonalUserInputs extends StatelessWidget {
  final TextEditingController adress;
  final TextEditingController phoneNumber;
  final TextEditingController userName;
  final FormFieldSetter<String>? onSaved;

  const SecondPagePersonalUserInputs({
    super.key,
    required this.adress,
    required this.phoneNumber,
    required this.userName,
    this.onSaved,
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
              isSmall: true,

              validator: Validators.validateIsNotEmpty,
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
              isSmall: true,
              validator: Validators.validatePhone,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.area,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  context.l10n.allowedAreas,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SecondPagePersonalUserAreasInput(onSaved: onSaved),
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
              controller: adress,
              name: context.l10n.enterAddress,
              inputType: TextInputType.streetAddress,
              validator: Validators.validateIsNotEmpty,
            ),
          ],
        ),
      ],
    );
  }
}
