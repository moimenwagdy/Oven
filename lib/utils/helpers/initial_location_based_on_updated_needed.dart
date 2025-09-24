import 'package:in_app_update/in_app_update.dart';
import 'package:oven/utils/helpers/current_version.dart';

Future<String> whereToNavigate() async {
  bool updateNeeded = false;
  String? oldVersion;
  int? newVersion;

  try {
    final checkNewAndroidUpdate = await InAppUpdate.checkForUpdate();
    updateNeeded =
        checkNewAndroidUpdate.updateAvailability ==
        UpdateAvailability.updateAvailable;

    if (updateNeeded) {
      newVersion = checkNewAndroidUpdate.availableVersionCode;
      oldVersion = await showAppVersion();
    }
  } catch (_) {
    updateNeeded = false;
  }

  if (updateNeeded) {
    return '/update?oldVersion=$oldVersion&newVersion=$newVersion';
  } else {
    return '/';
  }
}
