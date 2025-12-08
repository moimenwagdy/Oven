import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class InformationButton extends StatefulWidget {
  const InformationButton({super.key});

  @override
  State<InformationButton> createState() => _InformationButtonState();
}

class _InformationButtonState extends State<InformationButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      onPressed: () async {
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              title: Text(context.l10n.customerCodeGuide),
              content: Text(context.l10n.customerCodeInformation),
            );
          },
        );
      },
      icon: Icon(Icons.info_sharp),
    );
  }
}
