import 'dart:io';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatefulWidget {
  // final String newVersion;
  // final String oldVersion;
  const UpdatePage({
    super.key,
    // required this.oldVersion,
    // required this.newVersion,
  });

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  Future<void> performAndroidUpdate() async {
    try {
      final checkNewAndroidUpdate = await InAppUpdate.checkForUpdate();
      final updateNeeded =
          checkNewAndroidUpdate.updateAvailability ==
          UpdateAvailability.updateAvailable;
      if (updateNeeded) {
        await InAppUpdate.performImmediateUpdate();
      }
    } catch (e) {
      if (e is PlatformException && e.code == 'USER_CANCELED') {
        try {
          final checkNewAndroidUpdateAgain = await InAppUpdate.checkForUpdate();
          final updateNeededAgain =
              checkNewAndroidUpdateAgain.updateAvailability ==
              UpdateAvailability.updateAvailable;
          if (updateNeededAgain) {
            await InAppUpdate.performImmediateUpdate();
          }
        } catch (e) {
          if (e is PlatformException && e.code == 'USER_CANCELED') {
            openStorePage();
          }
        }
      } else {
        print("Other error: $e");
      }
    }
    //////////////////
    if (Platform.isIOS) {
      return;
    }
  }

  Future<void> openStorePage() async {
    final String appId = "com.oven.app"; // replace with your real package name
    final Uri playStoreUrl = Uri.parse(
      "https://play.google.com/store/apps/details?id=$appId",
    );
    if (Platform.isAndroid) {
      if (!await launchUrl(
        playStoreUrl,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception("Could not launch Play Store");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isAndroid = Platform.isAndroid;
    final bool isIOS = Platform.isIOS;
    final String storeName = isIOS
        ? "Apple Store"
        : isAndroid
        ? "Play Store"
        : "";
    print(storeName);
    final state = GoRouterState.of(context);
    final oldVersion = state.uri.queryParameters["oldVersion"];
    final newVersion = state.uri.queryParameters["newVersion"];
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: context.isSmallDevice ? 80 : 120),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: .09),
                ),
                Image.asset(
                  "lib/assets/logo_larg.png",
                  width: context.screenWidth * .75,
                ),
              ],
            ),
            SizedBox(height: context.isSmallDevice ? 80 : 120),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "New Update Available".toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Text(
                    "Your current app version $oldVersion should be replaced with New version $newVersion",
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(
                      context.isSmallDevice ? 300 : 345,
                      context.isSmallDevice ? 48 : 60,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: performAndroidUpdate,
                  child: Text(
                    "Update now",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
