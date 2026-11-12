import 'package:shorebird_code_push/shorebird_code_push.dart';

Future<bool> isShorebirdPatchAvailable() async {
  try {
    final updater = ShorebirdUpdater();

    final status = await updater.checkForUpdate();

    return status == UpdateStatus.outdated ||
        status == UpdateStatus.restartRequired;
  } catch (_) {
    return false;
  }
}
