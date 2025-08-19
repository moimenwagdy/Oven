import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class DontHaveAccountButton extends StatelessWidget {
  const DontHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.l10n.haveNoAccount,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        GestureDetector(
          onTap: () {
            print("object");
          },
          child: Text(
            context.l10n.signup,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
