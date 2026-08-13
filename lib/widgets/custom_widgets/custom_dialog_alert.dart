import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
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
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.isSmallDevice ? 5 : 10,
          children: [
            SizedBox(
              width: context.isSmallDevice ? 110 : 120,
              child: CustomGlobalButton(
                child: confirmationMessage,
                onPressed: onConfirm,
              ),
            ),
            SizedBox(
              width: context.isSmallDevice ? 110 : 120,
              child: CustomGlobalButton(
                child: cancelationMessage,
                onPressed: onCancel,
              ),
            ),
          ],
        ),
      );
    },
  );
}
