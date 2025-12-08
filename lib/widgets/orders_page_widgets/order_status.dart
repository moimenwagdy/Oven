import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  const OrderStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    switch (status) {
      case "Delivered":
        color = Colors.greenAccent.withValues(alpha: .2);
      case "Preparing":
        color = Colors.blueAccent.withValues(alpha: .2);
      case "Cancelled":
        color = Colors.redAccent.withValues(alpha: .2);
        break;
      default:
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: context.isArabic ? Radius.circular(0) : Radius.circular(12),
          bottomLeft: context.isArabic
              ? Radius.circular(6)
              : Radius.circular(0),
          topRight: context.isArabic ? Radius.circular(12) : Radius.circular(0),
          bottomRight: context.isArabic
              ? Radius.circular(0)
              : Radius.circular(6),
        ),
      ),
      child: Text(status, style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
