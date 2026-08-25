import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/signup_providers/external_signup_manager_form_state_provider/exernal_manager_signup_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';

class ExternalManagerSignupInputs extends ConsumerStatefulWidget {
  const ExternalManagerSignupInputs({super.key});

  @override
  ConsumerState<ExternalManagerSignupInputs> createState() =>
      _ExternalManagerSignupInputsState();
}

class _ExternalManagerSignupInputsState
    extends ConsumerState<ExternalManagerSignupInputs> {
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
    final notifier = ref.read(externalManagerSignupProvider.notifier);
    return Column(
      children: [
        CustomSignupLoginInputAndLabel(
          controller: _nameController,
          label: context.l10n.userName,
          placeholder: context.l10n.enterUserName,
          type: TextInputType.text,
          onChanged: notifier.setUserName,
          validator: (value) => Validators.validateUserName(value),
        ),
        CustomSignupLoginInputAndLabel(
          controller: _phoneController,
          label: context.l10n.phoneNumber,
          placeholder: context.l10n.enterphoneNumber,
          type: TextInputType.text,
          onChanged: notifier.setPhone,
          validator: (value) => Validators.validatePhone(value),
        ),
        CustomSignupLoginInputAndLabel(
          controller: _passwordController,
          label: context.l10n.password,
          placeholder: context.l10n.enterPassword,
          type: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: notifier.setPassword,
          validator: (value) => Validators.validatePassword(value),
        ),
        CustomSignupLoginInputAndLabel(
          controller: _repeatPasswordController,
          label: context.l10n.confirmPasswrod,
          placeholder: context.l10n.repeatPasswrod,
          type: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: notifier.setConfirmPassword,
          validator: (value) => Validators.validateConfirmPassword(
            value,
            _passwordController.text,
          ),
        ),
      ],
    );
  }
}
