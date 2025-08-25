import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_text_field.dart';
import 'package:oven/widgets/signup_page_widgets/signup_second_page_widgets/second_page_personal_user/second_page_personal_user_areas_input.dart';

class SecondPagePersonalUserInputs extends StatelessWidget {
  final TextEditingController otherInformation;
  final TextEditingController adress;
  final TextEditingController phoneNumber;
  final TextEditingController userName;
  final FormFieldSetter<String>? onSaved;


  const SecondPagePersonalUserInputs({
    super.key,
    required this.adress,
    required this.otherInformation,
    required this.phoneNumber,
    required this.userName,
    this.onSaved
  });

  @override
  Widget build(BuildContext context) {

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
              prefixIcon: Icons.person_2,
              inputType: TextInputType.text,
              isSmall: true,
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
              prefixIcon: Icons.phone,
              inputType: TextInputType.text,
              isSmall: true,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.area),
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
          spacing: 4.h,
          children: [
            Text(context.l10n.address),
            CustomTextField(
              controller: adress,
              name: context.l10n.enterAddress,
              prefixIcon: Icons.motorcycle,
              inputType: TextInputType.streetAddress,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(context.l10n.moreInfo),
            CustomTextField(
              controller: otherInformation,
              name: context.l10n.enterMoreInfo,
              prefixIcon: Icons.book,
              inputType: TextInputType.text,
            ),
          ],
        ),
      ],
    );
  }
}
