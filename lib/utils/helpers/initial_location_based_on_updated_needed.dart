import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/utils/helpers/current_version.dart';

Future<String> whereToNavigate(ProviderContainer container) async {
  try {
    final user = container.read(currentSessionProvider);
    return user != null ? '/home' : '/';
  } catch (_) {
    return '/';
  }
}

// return '/update?oldVersion=$oldVersion&newVersion=$newVersion';

Future<NewUpdateAvailble?> isUpdateAvailable() async {
  try {
    final info = await InAppUpdate.checkForUpdate();
    debugPrint(
      'InAppUpdate: availability=${info.updateAvailability}, '
      'availableVersionCode=${info.availableVersionCode}',
    );

    if (info.updateAvailability != UpdateAvailability.updateAvailable) {
      return null;
    }

    final newVersion = info.availableVersionCode;
    if (newVersion == null) return null;

    final oldVersion = await showAppVersion();
    return NewUpdateAvailble(newVersion: newVersion, oldVersion: oldVersion);
  } catch (e, st) {
    debugPrint('InAppUpdate check failed: $e\n$st');
    return null;
  }
}

class NewUpdateAvailble {
  final String oldVersion;
  final int newVersion;
  NewUpdateAvailble({required this.newVersion, required this.oldVersion});
}
