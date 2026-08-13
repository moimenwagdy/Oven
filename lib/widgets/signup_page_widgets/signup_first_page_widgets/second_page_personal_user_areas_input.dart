import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/utils/helpers/validators.dart';

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
  const SecondPagePersonalUserAreasInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        SizedBox(
          width: context.isPortrait ? context.screenWidth : 400,
          child: Row(
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
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.isPortrait ? context.screenWidth : 400,
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 1.2),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),

              isDense: true,
              labelText: context.l10n.selectArea,
              counterText: "",

              labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: .5),
              ),
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(
                    fontSize: 16.h,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: lighterPrimary, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            // value: null, // or a default value
            items: areasAvailableToDeliveryInAlexandria
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (value) {},
            // validator: Validators.validateDropdown,
          ),
        ),
      ],
    );
  }
}
