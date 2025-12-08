import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class SelectedCategoryTitle extends StatelessWidget {
  final String title;
  final String imgUrl;

  const SelectedCategoryTitle({
    super.key,
    required this.title,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .75,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: grediantsColors(context),
      //     begin: Alignment.centerLeft,
      //     end: Alignment.centerRight,
      //   ),
      // ),
      height: 35,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            );
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: scale, child: child),
            );
          },
          child: Row(
            key: ValueKey<String>('${title}_$imgUrl'),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: primary,
                  fontSize: 22,
                  fontWeight: context.isArabic
                      ? FontWeight.w700
                      : FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              // const SizedBox(width: 10),
              // Image.asset(imgUrl, width: 30),
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> grediantsColors(BuildContext context) {
  if (!context.isDarkMode) {
    return [
      onSecondaryFixed.withValues(alpha: .7),
      onSecondaryFixed.withValues(alpha: .6),
      onSecondaryFixed.withValues(alpha: .5),
      onSecondaryFixed.withValues(alpha: .4),
      onSecondaryFixed.withValues(alpha: .3),
      onSecondaryFixed.withValues(alpha: .2),
      onSecondaryFixed.withValues(alpha: .1),
      onSecondaryFixed.withValues(alpha: 0),
      onSecondaryFixed.withValues(alpha: 0),
      onSecondaryFixed.withValues(alpha: 0),
      onSecondaryFixed.withValues(alpha: 0),
      onSecondaryFixed.withValues(alpha: 0),
      onSecondaryFixed.withValues(alpha: 0),
      onSecondaryFixed.withValues(alpha: .1),
      onSecondaryFixed.withValues(alpha: .2),
      onSecondaryFixed.withValues(alpha: .3),
      onSecondaryFixed.withValues(alpha: .4),
      onSecondaryFixed.withValues(alpha: .5),
      onSecondaryFixed.withValues(alpha: .6),
      onSecondaryFixed.withValues(alpha: .7),
    ];
  } else {
    return [
      onSurface.withValues(alpha: .7),
      onSurface.withValues(alpha: .6),
      onSurface.withValues(alpha: .5),
      onSurface.withValues(alpha: .4),
      onSurface.withValues(alpha: .3),
      onSurface.withValues(alpha: .2),
      onSurface.withValues(alpha: .1),
      onSurface.withValues(alpha: 0),
      onSurface.withValues(alpha: 0),
      onSurface.withValues(alpha: 0),
      onSurface.withValues(alpha: 0),
      onSurface.withValues(alpha: 0),
      onSurface.withValues(alpha: 0),
      onSurface.withValues(alpha: .1),
      onSurface.withValues(alpha: .2),
      onSurface.withValues(alpha: .3),
      onSurface.withValues(alpha: .4),
      onSurface.withValues(alpha: .5),
      onSurface.withValues(alpha: .6),
      onSurface.withValues(alpha: .7),
    ];
  }
}
