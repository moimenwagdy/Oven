import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';

class SignupThirdPageLocationDetailsInputs extends ConsumerStatefulWidget {
  const SignupThirdPageLocationDetailsInputs({super.key});

  @override
  ConsumerState<SignupThirdPageLocationDetailsInputs> createState() =>
      _SignupThirdPageLocationDetailsInputsState();
}

class _SignupThirdPageLocationDetailsInputsState
    extends ConsumerState<SignupThirdPageLocationDetailsInputs> {
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
    final notifier = ref.read(signupProvider.notifier);

    return Column(
      children: [
        CustomSignupLoginInputAndLabel(
          controller: _city,
          label: context.l10n.city,
          placeholder: context.l10n.enterCity,
          type: TextInputType.text,
          onChanged: (value) => notifier.setCity(value),
          validator: (value) => Validators.validateIsNotEmpty(value),
        ),
        CustomSignupLoginInputAndLabel(
          controller: _area,
          label: context.l10n.area,
          placeholder: context.l10n.selectArea,
          type: TextInputType.text,
          onChanged: (value) => notifier.setArea(value),
          validator: (value) => Validators.validateIsNotEmpty(value),
        ),
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
              validator: (value) => Validators.validateIsNotEmpty(value),
            ),
            CustomSignupLoginInputAndLabel(
              isSmall: true,
              controller: _floor,
              label: "Floor",
              placeholder: "Floor",
              type: TextInputType.text,
              onChanged: (value) => notifier.setFloor(value),
            ),
            CustomSignupLoginInputAndLabel(
              isSmall: true,
              controller: _flat,
              label: "Flat",
              placeholder: "Flat",
              type: TextInputType.text,
              onChanged: (value) => notifier.setDetails(value),
            ),
          ],
        ),
        CustomSignupLoginInputAndLabel(
          controller: _details,
          onChanged: (value) => notifier.setDetails(value),
          label: "More Details",
          placeholder: "More Details",
          type: TextInputType.text,
        ),
      ],
    );
  }
}
