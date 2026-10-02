import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/current_version.dart';

Future<String> whereToNavigate(ProviderContainer container) async {
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
    return Uri(
      path: '/update',
      queryParameters: {
        'oldVersion': oldVersion ?? '',
        'newVersion': newVersion?.toString() ?? '',
      },
    ).toString();
  } else {
    try {
      final user = await container.read(fakeAuthProvider.future);
      return user != null ? '/home' : '/';
    } catch (_) {
      return '/';
    }
  }
}

// return '/update?oldVersion=$oldVersion&newVersion=$newVersion';
