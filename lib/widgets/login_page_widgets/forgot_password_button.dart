import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom%20widgets/custom_gesture_detector_message_and_action.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetectorMessageAndAction(
      actionToTake: () {},
      gestureChild: Text(
        context.l10n.forgotPassword,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
