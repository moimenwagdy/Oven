import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ReceiptHeader extends StatelessWidget {
  const ReceiptHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        children: [
          SizedBox(
            width: (context.screenWidth - 26) * .10,
            child: Text(
              textAlign: TextAlign.center,
              context.l10n.receiptQuantity,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isArabic ? 12 : 14,
              ),
            ),
          ),
          SizedBox(width: (context.screenWidth - 26) * .008),
          SizedBox(
            width: (context.screenWidth - 26) * .45,
            child: Text(
              context.l10n.description,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isArabic ? 12 : 14,
              ),
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 26) * .22,
            child: Text(
              textAlign: context.isArabic? TextAlign.start : TextAlign.center,
              context.l10n.receiptUnitPrice,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isArabic ? 12 : 14,
              ),
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 26) * .22,
            child: Text(
              textAlign: TextAlign.center,
              context.l10n.receiptAmount,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isArabic ? 12 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
