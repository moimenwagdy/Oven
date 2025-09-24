import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class BorderWithTextBetweenTopBorder extends StatelessWidget {
  final Widget widgetChild;
  final String headMessage;
  const BorderWithTextBetweenTopBorder({
    super.key,
    required this.widgetChild,
    required this.headMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Container(
            width: context.isPortrait ? context.screenWidth : 400,
            padding: EdgeInsets.fromLTRB(0, 15.h, 0, 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: .1),
                width: 2,
              ),
            ),
            child: widgetChild,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Transform.translate(
            offset: const Offset(0, -12),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                headMessage,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
