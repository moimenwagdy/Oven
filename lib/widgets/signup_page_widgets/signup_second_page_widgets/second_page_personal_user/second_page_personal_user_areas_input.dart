import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

final List<String> areasAvailableToDeliveryInAlexandria = [
  "أبو قير",
  "السرايا",
  "المنتزه",
  "كيلوباترا",
  "العصافرة",
  "سيدى بشر",
  "لوران",
  "الشاطبى",
  "جليم",
  "سيدى جابر",
  "المندرة",
  "الكيلو 21",
  "رشدى",
  "طوسون",
  "فيكتوريا",
  "الساعه",
];

class SecondPagePersonalUserAreasInput extends StatelessWidget {
  final FormFieldSetter<String>? onSaved;

  const SecondPagePersonalUserAreasInput({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 1.2),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 8),
        prefixIcon: Icon(
          Icons.flag,
          color: Theme.of(context).colorScheme.primary,
        ),
        isDense: true,
        labelText: context.l10n.selectArea,
        counterText: "",

        /// PLACEHOLDER COLOR
        labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(.5),
        ),
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16.h,
          color: Theme.of(context).colorScheme.secondary,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: lighterPrimary, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      value: null, // or a default value
      items: areasAvailableToDeliveryInAlexandria
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: (value) {},
      onSaved: onSaved,
      validator: (value) => value == null ? "Please select a province" : null,
    );
  }
}
