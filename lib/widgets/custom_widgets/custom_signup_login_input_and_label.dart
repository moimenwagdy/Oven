import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_text_field.dart';

class CustomSignupLoginInputAndLabel extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String placeholder;
  final TextInputType type;
  final bool obscureText;
  final bool? isSmall;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomSignupLoginInputAndLabel({
    super.key,
    required this.controller,
    required this.label,
    required this.placeholder,
    required this.type,
    this.obscureText = false,
    this.isSmall,
    this.enabled = true,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label, style: Theme.of(context).textTheme.labelLarge),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: CustomTextField(
            controller: controller ?? TextEditingController(),
            name: placeholder,
            enabled: enabled,
            inputType: TextInputType.text,
            obscureText: obscureText,
            onChanged: onChanged,
            validator: validator,
            isSmall: isSmall,
          ),
        ),
      ],
    );
  }
}
