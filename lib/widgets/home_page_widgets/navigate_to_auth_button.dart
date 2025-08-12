import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/colors.dart';

class NavigateToAuthButton extends StatelessWidget {
  final String child;
  final String destination;
  const NavigateToAuthButton({
    super.key,
    required this.child,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(180.h, 70.h),
            side: BorderSide(color: primary, width: 2.h),
            backgroundColor: Colors.transparent,
          ),
          onPressed: child == "Login"
              ? () => context.push(destination)
              : () => {},
          child: Text(
            child,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontSize: 18.h,
            ),
          ),
        );
      },
    );
  }
}
