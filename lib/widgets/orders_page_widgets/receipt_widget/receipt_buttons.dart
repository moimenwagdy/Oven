import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/custom_global_button.dart';

class ReceiptButtons extends StatelessWidget {
  const ReceiptButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: context.isSmallDevice ? 35 : 40,
          width: (context.screenWidth - 30) * .5,
          child: CustomGlobalButton(onPressed: () => {}, child: context.l10n.placeOrder),
        ),
        SizedBox(width: 10),
        SizedBox(
          height: context.isSmallDevice ? 35 : 40,
          width: (context.screenWidth - 30) * .5,
          child: CustomGlobalButton(
            onPressed: () => { context.push("/products")},
            child: context.l10n.addMoreItems,
          ),
        ),
      ],
    );
  }
}
