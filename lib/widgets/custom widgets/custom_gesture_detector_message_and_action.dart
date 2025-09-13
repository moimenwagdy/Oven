import 'package:flutter/material.dart';

class CustomGestureDetectorMessageAndAction extends StatelessWidget {
  final String? type;
  final String? primaryMessage;
  final VoidCallback actionToTake;
  final Widget gestureChild;
  const CustomGestureDetectorMessageAndAction({
    super.key,
    this.type,
    this.primaryMessage,
    required this.actionToTake,
    required this.gestureChild,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (primaryMessage != null) ...[
          Text(primaryMessage!, style: Theme.of(context).textTheme.bodySmall),
        ],
        GestureDetector(onTap: actionToTake, child: gestureChild),
      ],
    );
  }
}
