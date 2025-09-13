import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class UpdateChecker {
  static final Upgrader _upgrader = Upgrader();

  static Future<void> checkForUpdate(BuildContext context) async {
    await _upgrader.initialize();
    final shouldDisplay = _upgrader.shouldDisplayUpgrade();

    if (shouldDisplay && context.mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return UpgradeAlert(
            upgrader: _upgrader,
            barrierDismissible: false,
            showIgnore: false,
            showLater: false,
            dialogStyle: UpgradeDialogStyle.material,
            child: const SizedBox.shrink(), // acts as placeholder
          );
        },
      );
    }
  }
}
