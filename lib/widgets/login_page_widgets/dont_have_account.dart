import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_gesture_detector_message_and_action.dart';

class DontHaveAccount extends StatelessWidget {
  final String type;
  const DontHaveAccount({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetectorMessageAndAction(
      type: type,
      primaryMessage: "${context.l10n.haveNoAccount} ",
      actionToTake: () {
        context.go("/signup/$type");
      },
      gestureChild: Text(
        context.l10n.signup,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
