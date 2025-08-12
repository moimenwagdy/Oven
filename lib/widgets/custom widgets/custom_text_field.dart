import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.name,
    required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: TextFormField(
        validator: validator,
        cursorHeight: 24.h,
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLength: 32,
        maxLines: 1,
        obscureText: obscureText,

        keyboardType: inputType,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.h),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 1.2),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 8),
          prefixIcon: Icon(prefixIcon, color: Colors.white),
          isDense: true,
          labelText: name,
          counterText: "",
          labelStyle: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: onPrimary),

          floatingLabelStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 16.h, color: Colors.black87),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: lighterPrimary, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
