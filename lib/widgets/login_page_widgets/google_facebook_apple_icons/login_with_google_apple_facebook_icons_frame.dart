import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class LoginWithGoogleAppleFacebookIconsFrame extends StatelessWidget {
  const LoginWithGoogleAppleFacebookIconsFrame({
    super.key,
    required this.imgSource,
    required this.width,
    this.iconColor,
    required this.brand,
  });
  final String imgSource;
  final Color? iconColor;
  final double width;
  final String brand;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.all(
              color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: context.isDarkMode ? .15 : .09,
              ),
            ),
          ),
          child: Center(
            child: Image.asset(imgSource, width: width, color: iconColor),
          ),
        ),
        Text(brand, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
