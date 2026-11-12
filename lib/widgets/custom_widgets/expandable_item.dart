import 'package:flutter/material.dart';

class ExpandableItem extends StatelessWidget {
  final bool isExpanded;
  final Widget childWidget;

  const ExpandableItem({
    super.key,
    required this.isExpanded,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(heightFactor: isExpanded ? 1.0 : 0.0, child: childWidget),
    );
  }
}
