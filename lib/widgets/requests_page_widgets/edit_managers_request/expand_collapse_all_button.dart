import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class ExpandCollapseAllButton extends ConsumerWidget {
  final String title;
  final Function()? onPressed;

  const ExpandCollapseAllButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 30,
            width: 100,
            constraints: BoxConstraints(
              minWidth: context.isSmallDevice ? 100 : 110,
              maxWidth: context.isSmallDevice ? 105 : 115,
              minHeight: 30,
              maxHeight: 32,
            ),
            child: FormSubmitButtom(
              textChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Icon(
                      // oneIsExpanded ? Icons.unfold_less :
                      Icons.unfold_more,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
