import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class LandingNavigathionButton extends StatelessWidget {
  final String child;
  final String destination;
  final Color color;
  const LandingNavigathionButton({
    super.key,
    required this.child,
    required this.destination,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(
              context.isSmallDevice ? 300 : 345,
              context.isSmallDevice ? 48 : 60,
            ),
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          onPressed: () => context.push(destination),
          child: Text(
            child,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );

        ////////////////////  first viwe three buttons with different colors /////////////////////////
        ///
        ///
        ///
        // OutlinedButton(
        //   style: OutlinedButton.styleFrom(
        //     minimumSize: Size(double.infinity, 60.h),
        //     backgroundColor: color,
        //     foregroundColor: Theme.of(context).colorScheme.onSecondary,
        //     side: BorderSide(color: Theme.of(context).colorScheme.primary),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(24),
        //     ),
        //   ),
        //   onPressed: () => context.push(destination),
        //   child: Text(child, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
        // );
      },
    );
  }
}
