import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ReceiptCounter extends StatelessWidget {
  const ReceiptCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: (context.screenWidth - 26) * .55,
          child: Column(
            spacing: 10,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: (context.screenWidth - 26) * .275,
                    child: Text(
                      context.l10n.subTotal,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: (context.screenWidth - 26) * .275,
                    child: Text(
                      "580 EGP",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: (context.screenWidth - 26) * .275,
                    child: Text(
                      "${context.l10n.taxes} (5%)",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (context.screenWidth - 26) * .275,
                    child: Text(
                      "56 EGP",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: BoxBorder.symmetric(
                    horizontal: BorderSide(color: primary),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: (context.screenWidth - 26) * .275,
                      child: Text(
                        context.l10n.total,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (context.screenWidth - 26) * .275,
                      child: Text(
                        "547458 EGP",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
