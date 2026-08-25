import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/custom_gesture_detector_message_and_action.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetectorMessageAndAction(
      primaryMessage: "${context.l10n.haveNoAccount} ",
      actionToTake: () {
        context.go("/personal");
      },
      gestureChild: Text(
        context.l10n.signup,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
