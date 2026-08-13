import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';
import 'package:oven/widgets/signup_page_widgets/signup_first_page_widgets/second_page_personal_user_areas_input.dart';

class ExternalSignupFirstPageInputs extends ConsumerStatefulWidget {
  final String type;
  const ExternalSignupFirstPageInputs({super.key, required this.type});

  @override
  ConsumerState<ExternalSignupFirstPageInputs> createState() =>
      _ExternalSignupFirstPageInputsState();
}

class _ExternalSignupFirstPageInputsState
    extends ConsumerState<ExternalSignupFirstPageInputs> {
  // These exist only because CustomTextField requires a controller.
  // Nothing ever reads their .text — the notifier state is the source of truth.
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(signupFormProvider.notifier);
    final isPersonal = widget.type == "personal";

    return Column(
      spacing: 10,
      children: [
        CustomSignupLoginInputAndLabel(
          controller: _nameController,
          label: context.l10n.userName,
          placeholder: context.l10n.enterUserName,
          type: TextInputType.text,
          onChanged: notifier.setName,
          validator: (value) =>
              (value == null || value.isEmpty) ? context.l10n.userName : null,
        ),
        CustomSignupLoginInputAndLabel(
          controller: _phoneController,
          label: context.l10n.phoneNumber,
          placeholder: context.l10n.enterphoneNumber,
          type: TextInputType.text,
          onChanged: notifier.setPhone,
          validator: (value) => (value == null || value.isEmpty)
              ? context.l10n.phoneNumber
              : null,
        ),
        if (isPersonal) SecondPagePersonalUserAreasInput(),
        CustomSignupLoginInputAndLabel(
          controller: _addressController,
          label: context.l10n.address,
          placeholder: context.l10n.enterAddress,
          type: TextInputType.text,
          onChanged: notifier.setAddress,
        ),
        CustomSignupLoginInputAndLabel(
          controller: _emailController,
          label: context.l10n.email,
          placeholder: context.l10n.enterEmail,
          type: TextInputType.text,
          onChanged: notifier.setEmail,
        ),
        CustomSignupLoginInputAndLabel(
          controller: _passwordController,
          label: context.l10n.password,
          placeholder: context.l10n.enterPassword,
          type: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: notifier.setPassword,
        ),
        CustomSignupLoginInputAndLabel(
          controller: _repeatPasswordController,
          label: context.l10n.confirmPasswrod,
          placeholder: context.l10n.repeatPasswrod,
          type: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: notifier.setRepeatPassword,
          validator: (value) => value != ref.read(signupFormProvider).password
              ? context.l10n.confirmPasswrod
              : null,
        ),
      ],
    );
  }
}
