import 'package:flutter/material.dart';
import 'package:oven/notifires/customer_code_informations.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class InformationButton extends StatefulWidget {
  const InformationButton({super.key});

  @override
  State<InformationButton> createState() => _InformationButtonState();
}

class _InformationButtonState extends State<InformationButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isHide,
      builder: (context, value, child) {
        return IconButton(
          iconSize: 20,
          // onPressed: () => isHide.value = !isHide.value,
          onPressed: () async {
            await showDialog(
              context: context,
              barrierDismissible: true, // tap outside closes
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
      },
    );
  }
}
