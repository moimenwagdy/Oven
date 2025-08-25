import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class DontHaveAccountButton extends StatelessWidget {
  final String type;
  const DontHaveAccountButton({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    print(type);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${context.l10n.haveNoAccount} ",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        GestureDetector(
          onTap: () {
            context.push("/signup/$type");
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
