import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class HomePageMiddleTabsBarTab extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onClick;

  const HomePageMiddleTabsBarTab({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    const kAnimationDuration = Duration(milliseconds: 220);
    final double tabWidth = context.screenWidth * .38;
    // final double tabWidth = isSelected
    //     ? context.screenWidth / 2.85
    //     : context.screenWidth / 5.15;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.isSmallDevice ? 35 : 45,
        minWidth: tabWidth,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: !isSelected
              ? Theme.of(context).colorScheme.secondary.withValues(alpha: .5)
              : Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextButton(
          onPressed: onClick,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSelected
                  ? Text(
                      text,
                      key: ValueKey(text),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 12,
                      ),
                    )
                  : SizedBox(width: 1),
              isSelected ? SizedBox(width: 6) : SizedBox.shrink(),
              AnimatedOpacity(
                duration: kAnimationDuration,
                opacity: 1,
                child: Icon(
                  icon,
                  color: !isSelected
                      ? Theme.of(context).colorScheme.onSurface
                      : primary,
                  size: isSelected
                      ? 15
                      : context.isSmallDevice
                      ? 17
                      : 20,
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
