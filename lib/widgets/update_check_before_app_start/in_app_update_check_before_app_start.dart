import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateCheckBeforeAppStarts extends StatefulWidget {
  final Widget child;
  const UpdateCheckBeforeAppStarts({super.key, required this.child});

  @override
  State<UpdateCheckBeforeAppStarts> createState() =>
      _UpdateCheckBeforeAppStartsState();
}

class _UpdateCheckBeforeAppStartsState extends State<UpdateCheckBeforeAppStarts>
    with WidgetsBindingObserver {
  bool _checking = false;
  bool _doneChecking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkForUpdate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkForUpdate();
    }
  }

  Future<void> _checkForUpdate() async {
    if (_checking) return;
    _checking = true;
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
      debugPrint("Update check failed: $e");
    } finally {
      if (mounted) {
        setState(() => _doneChecking = true);
      }
      _checking = false;
      debugPrint("---------- in app update process done ----------");
    }
  }

  // void _showFlexibleSnackbar() {
  //   if (!mounted) return;
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: const Text(
  //         'A new update has been downloaded. Restart to apply.',
  //       ),
  //       action: SnackBarAction(
  //         label: 'Restart',
  //         onPressed: () async {
  //           try {
  //             await InAppUpdate.completeFlexibleUpdate();
  //           } catch (e) {
  //             debugPrint('Complete flexible update failed: $e');
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // While checking → show a splash background matching your native splash
    if (!_doneChecking) {
      return Container(
        color: Theme.of(
          context,
        ).colorScheme.onPrimary, // same as your splash background
        alignment: Alignment.center,
        child: Image.asset(
          'lib/assets/logo_larg.png', // same logo as flutter_native_splash
          width: 160,
        ),
      );
    }
    // After update check → show the real app
    return widget.child;
  }
}

// class AppCloser {
//   static const platform = MethodChannel('app_channel');

//   static Future<void> closeApp() async {
//     await platform.invokeMethod('finishAffinity');
//   }
// }
