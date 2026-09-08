import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/white_background_screen_radiused_for_login_and_signup_forms.dart';
import 'package:oven/widgets/signup_page_widgets/manager_location_fourth_page_widgets/manager_location_forth_page_map.dart';

class ManagerLocationForthPageContainer extends StatefulWidget {
  const ManagerLocationForthPageContainer({super.key});

  @override
  State<ManagerLocationForthPageContainer> createState() =>
      _ManagerLocationForthPageContainerState();
}

class _ManagerLocationForthPageContainerState
    extends State<ManagerLocationForthPageContainer> {
  @override
  Widget build(BuildContext context) {
    return WhiteBackgroundScreenRadiusedForLoginAndSignupForms(
      childWidget: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ManagerLocationForthPageMap(
                  onCameraMove: (p0) {
                    print("Camera moved to: $p0");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
