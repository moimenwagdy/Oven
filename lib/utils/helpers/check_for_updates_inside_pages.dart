import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';
// import 'package:oven/widgets/update_check_before_app_start/in_app_update_check_before_app_start.dart';

Future<bool> checkForUpdate() async {
  try {
    final info = await InAppUpdate.checkForUpdate();
    if (info.updateAvailability == UpdateAvailability.updateAvailable) {
      if (info.immediateUpdateAllowed == true) {
        final result = await InAppUpdate.performImmediateUpdate();
        if (result == AppUpdateResult.success) {
          // AppCloser.closeApp();
          // SystemNavigator.pop();
        }
      } else if (info.flexibleUpdateAllowed == true) {
        final result = await InAppUpdate.startFlexibleUpdate();
        if (result == AppUpdateResult.success) {
          await InAppUpdate.completeFlexibleUpdate();
          // AppCloser.closeApp();
          // SystemNavigator.pop();
        }
        debugPrint("****** flexible update flow executed *******");
      }
    }
  } catch (e) {
    debugPrint('In-app update failed: $e');
    return false;
  }
  debugPrint("---------- in app update process done ----------");
  return false;
}
