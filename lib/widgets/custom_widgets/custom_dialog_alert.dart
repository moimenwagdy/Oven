import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/custom_global_button.dart';

Future customDialogAlert({
  required BuildContext context,
  required VoidCallback onCancel,
  required VoidCallback onConfirm,
  required Widget message,
  required String cancelationMessage,
  required String confirmationMessage,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (contexts) {
      return AlertDialog(
        title: message,
        content: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 12,
            children: [
              SizedBox(
                width: 120,
                child: CustomGlobalButton(
                  child: confirmationMessage,
                  onPressed: onConfirm,
                ),
              ),
              SizedBox(
                width: 120,
                child: CustomGlobalButton(
                  child: cancelationMessage,
                  onPressed: onCancel,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
