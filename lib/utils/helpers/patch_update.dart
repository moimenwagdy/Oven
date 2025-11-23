// import 'package:restart_app/restart_app.dart';
// import 'package:shorebird_code_push/shorebird_code_push.dart';
// import 'package:flutter/material.dart';

// class SilentUpdater {
//   final ShorebirdUpdater _updater = ShorebirdUpdater();

//   Future<void> checkAndUpdateSilently(BuildContext context) async {
//     if (!_updater.isAvailable) return;
//     try {
//       final status = await _updater.checkForUpdate();

//       if (status == UpdateStatus.outdated) {
//         await _updater.update();
//         if (!context.mounted) return;
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) {
//             Future.delayed(const Duration(seconds: 2), () {
//               if (context.mounted) {
//                 Navigator.of(context).pop();
//                 Restart.restartApp();
//               }
//             });
//             return const AlertDialog(
//               title: Text('Update Installed'),
//               content: Text(
//                 'A new update was applied. Restarting automatically...',
//               ),
//             );
//           },
//         );
//       }
//     } catch (e) {
//       debugPrint("Silent update failed: $e");
//     }
//   }
// }

// final _silentUpdater = SilentUpdater();

// Future<void> onRefresh(BuildContext context) async {
//   await Future.delayed(const Duration(seconds: 1));
//   if (!context.mounted) return;
//   await _silentUpdater.checkAndUpdateSilently(context);
// }
