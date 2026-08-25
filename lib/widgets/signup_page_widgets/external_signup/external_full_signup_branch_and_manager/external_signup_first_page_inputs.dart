import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/signup_providers/signup_form_state_provider/signup_form_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';

class ExternalSignupFirstPageInputs extends ConsumerStatefulWidget {
  final String payload;
  const ExternalSignupFirstPageInputs({super.key, required this.payload});

  @override
  ConsumerState<ExternalSignupFirstPageInputs> createState() =>
      _ExternalSignupFirstPageInputsState();
}

class _ExternalSignupFirstPageInputsState
    extends ConsumerState<ExternalSignupFirstPageInputs> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _branchNameController = TextEditingController();
  late TextEditingController _trademarkNameController;

  @override
  void initState() {
    super.initState();

    final trademarkName = widget.payload.isNotEmpty
        ? "Trademarkname from response id"
        : "";

    _trademarkNameController = TextEditingController(text: trademarkName);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(signupProvider.notifier).setTrademarkName(trademarkName);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _trademarkNameController.dispose();
    _branchNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(signupProvider.notifier);
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
          controller: _emailController,
          label: context.l10n.email,
          placeholder: context.l10n.enterEmail,
          type: TextInputType.text,
          onChanged: notifier.setEmail,
          validator: (value) => Validators.validateEmail(value),
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
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Container(
              height: 4,
              width: context.screenWidth * .8,
              color: Theme.of(context).colorScheme.primary,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Theme.of(context).colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text("Business Information"),
            ),
          ],
        ),
        SizedBox(height: 15),
        CustomSignupLoginInputAndLabel(
          controller: _trademarkNameController,
          label: context.l10n.merchantName,
          placeholder: context.l10n.merchantName,
          type: TextInputType.text,
          enabled: false,
        ),

        CustomSignupLoginInputAndLabel(
          controller: _branchNameController,
          label: context.l10n.branchName,
          placeholder: context.l10n.enterUserName,
          type: TextInputType.text,
          validator: (value) => Validators.validateIsNotEmpty(value),
        ),
      ],
    );
  }
}
