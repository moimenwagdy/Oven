import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:oven/utils/helpers/check_for_updates_inside_pages.dart';
// import 'package:oven/utils/helpers/check_for_updates_inside_pages.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/update_check_before_app_start/updater_update_check_before_app_start.dart';

class WhiteBackgroundScreenRadiusedForLoginAndSignupForms
    extends StatelessWidget {
  const WhiteBackgroundScreenRadiusedForLoginAndSignupForms({
    super.key,
    required this.childWidget,
  });
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: !context.isDarkMode
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).colorScheme.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: !context.isDarkMode
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: null,
        actions: [],
        toolbarHeight: 10.h,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: RefreshIndicator(
          onRefresh: () async {
            // await UpdateHelper.checkForUpdates(context);
            // UpdateChecker.checkForUpdate(context);

            // checkForUpdate();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              width: double.infinity,
              height: context.screenHeight * .95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              child: childWidget,
            ),
          ),
        ),
      ),
    );
  }
}
