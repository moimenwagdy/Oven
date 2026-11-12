import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ProfilePageSingleFieldEditForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function() onConfirm;
  final Function() onCancel;
  const ProfilePageSingleFieldEditForm({
    super.key,
    required this.controller,
    required this.onConfirm,
    required this.onCancel,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: EdgeInsets.all(5),
        height: context.isSmallDevice ? 40 : 50,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                style: Theme.of(context).textTheme.labelLarge,

                decoration: InputDecoration(
                  suffix: Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: IconButton(
                      color: Colors.green,
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: .5),
                      onPressed: onConfirm,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      iconSize: 14,
                      icon: Icon(Icons.done),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  isDense: true,
                  labelText: label,
                  counterText: "",
                  helperStyle: TextStyle(color: Colors.transparent),

                  /// PLACEHOLDER COLOR
                  labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: .5),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: lighterPrimary, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.undo,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 16,
                ),
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: onCancel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
