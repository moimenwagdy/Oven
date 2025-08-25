import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class SkipLandingPage extends StatelessWidget {
  const SkipLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        FractionallySizedBox(
          widthFactor: .33,
          child: Container(
            height: .75,
            width: double.infinity,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        SizedBox(height: 5),
        GestureDetector(
          child: Text(
            context.l10n.skipToProducts,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () => {},
        ),
      ],
    );
  }
}
