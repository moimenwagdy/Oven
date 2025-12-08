import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class NewCartItemsHeaderTest extends StatelessWidget {
  const NewCartItemsHeaderTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        children: [
          SizedBox(width: 5),
          SizedBox(
            width: (context.screenWidth - 26) * .35,
            // width: (context.screenWidth - 26) * .305,
            child: Text(
              context.l10n.description,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isArabic ? 11 : 12,
              ),
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 26) * .16,
            child: Text(
              textAlign: context.isArabic ? TextAlign.start : TextAlign.center,
              context.l10n.receiptUnitPrice,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isArabic ? 10 : 11,
              ),
            ),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: (context.screenWidth - 26) * .16,
            child: Text(
              textAlign: TextAlign.center,
              context.l10n.receiptAmount,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: context.isArabic ? 10 : 11,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Text(
                textAlign: TextAlign.center,
                context.l10n.receiptQuantity,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: context.isArabic ? 11 : 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
