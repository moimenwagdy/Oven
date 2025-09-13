import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class OrUseCredentials extends StatelessWidget {
  final String? type;
  const OrUseCredentials({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Text(
      type == "newMerchant"
          ? context.l10n.orUseEmail
          : context.l10n.orUseCredentials,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
