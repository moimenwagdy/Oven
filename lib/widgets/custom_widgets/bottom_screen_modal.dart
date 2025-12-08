import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

void bottomScreenModal(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    enableDrag: true,
    constraints: BoxConstraints(
      minWidth: double.infinity,
      maxHeight: context.isSmallDevice
          ? context.screenHeight * .65
          : context.screenHeight * .55,
      minHeight: context.screenHeight * .25,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return child;
    },
  );
}
