import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class InformationAboutCurrentMerchantCustomerCodeInput extends StatelessWidget {
  const InformationAboutCurrentMerchantCustomerCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .90,
      // height: 120.h,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: .3),
      ),
      child: Column(
        spacing: 10,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            width: context.screenWidth * .5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: .6),
            ),
            child: Center(
              child: Text(
                context.l10n.customerCodeGuide,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          Center(
            child: Text(
              context.l10n.customerCodeInformation,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
