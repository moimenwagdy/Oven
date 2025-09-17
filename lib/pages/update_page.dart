import 'dart:io';
import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/custom_form_submit_button.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

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

  Future<void> performSecondAndroidUpdate() async {
    try {
      final checkNewAndroidUpdate = await InAppUpdate.checkForUpdate();
      final updateNeeded =
          checkNewAndroidUpdate.updateAvailability ==
          UpdateAvailability.updateAvailable;
      bool imedIsaAllowed =
          checkNewAndroidUpdate.immediateUpdateAllowed == true;
      imedIsaAllowed = false;
      if (updateNeeded && imedIsaAllowed == true) {
        await InAppUpdate.performImmediateUpdate();
      } else {
        openStorePage();
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
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 80),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: .8),
                ),
                Image.asset(
                  "lib/assets/updateImage.webp",
                  width: context.screenWidth * .75,
                ),
              ],
            ),
            SizedBox(height: 80),
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
                    "Your current app version 1.0.2 should be replaced with New version 1.0.3",
                    textAlign: TextAlign.center,
                  ),
                ),
                FormSubmitButtom(
                  onPressed: performAndroidUpdate,
                  textChild: Text(
                    "Update now",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),
                FormSubmitButtom(
                  onPressed: performSecondAndroidUpdate,
                  textChild: Text(
                    "update",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white),
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
