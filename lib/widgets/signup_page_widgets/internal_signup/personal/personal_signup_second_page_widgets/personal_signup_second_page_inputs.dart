import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/providers/signup_providers/personal_signup_provider/personal_signup_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';
import 'package:oven/widgets/signup_page_widgets/internal_signup/business/signup_first_page_user%20and_busines_data/second_page_personal_user_areas_input.dart';

class PersonalSignupSecondPageInputs extends ConsumerStatefulWidget {
  const PersonalSignupSecondPageInputs({super.key});

  @override
  ConsumerState<PersonalSignupSecondPageInputs> createState() =>
      _PersonalSignupSecondPageInputsState();
}

class _PersonalSignupSecondPageInputsState
    extends ConsumerState<PersonalSignupSecondPageInputs> {
  final _city = TextEditingController();
  final _area = TextEditingController();
  final _street = TextEditingController();
  final _building = TextEditingController();
  final _floor = TextEditingController();
  final _flat = TextEditingController();
  final _details = TextEditingController();

  @override
  void dispose() {
    _city.dispose();
    _area.dispose();
    _street.dispose();
    _building.dispose();
    _floor.dispose();
    _flat.dispose();
    _details.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(personalSignupProvider.notifier);

    return Column(
      children: [
        SecondPagePersonalUserAreasInput(),
        SizedBox(height: 10.h),
        CustomSignupLoginInputAndLabel(
          controller: _street,
          label: context.l10n.street,
          placeholder: context.l10n.enterStreet,
          type: TextInputType.text,
          onChanged: (value) => notifier.setStreet(value),
          validator: (value) => Validators.validateIsNotEmpty(value),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSignupLoginInputAndLabel(
              controller: _building,
              label: "Building",
              placeholder: "Building",
              type: TextInputType.text,
              isSmall: true,
              onChanged: (value) => notifier.setBuilding(value),
              validator: (value) =>
                  Validators.validateIsNotEmpty(value, message: "Required"),
            ),
            CustomSignupLoginInputAndLabel(
              isSmall: true,
              controller: _floor,
              label: "Floor",
              placeholder: "Floor",
              type: TextInputType.text,
              onChanged: (value) => notifier.setFloor(value),
              validator: (value) =>
                  Validators.validateIsNotEmpty(value, message: "Required"),
            ),
            CustomSignupLoginInputAndLabel(
              isSmall: true,
              controller: _flat,
              label: "Flat Num.",
              placeholder: "Flat",
              type: TextInputType.text,
              onChanged: (value) => notifier.setDetails(value),
              validator: (value) =>
                  Validators.validateIsNotEmpty(value, message: "Required"),
            ),
          ],
        ),
        CustomSignupLoginInputAndLabel(
          controller: _details,
          label: "More Details",
          placeholder: "More Details",
          type: TextInputType.text,
          onChanged: (value) => notifier.setDetails(value),
          validator: (value) => Validators.validateIsNotEmpty(value),
        ),
      ],
    );
  }
}
