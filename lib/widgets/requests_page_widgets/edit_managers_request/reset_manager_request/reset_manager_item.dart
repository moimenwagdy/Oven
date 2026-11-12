import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/manager_summary.dart';
import 'package:oven/providers/requests/reset_manager_request/expand_collapse_reset_manager_provider.dart';
import 'package:oven/widgets/custom_widgets/expandable_item.dart';
import 'package:oven/widgets/requests_page_widgets/edit_managers_request/reset_manager_request/reset_manager_share_link_success_view.dart';

class ResetManagerItem extends ConsumerWidget {
  const ResetManagerItem({
    super.key,
    required this.manager,
    required this.link,
    required this.isSelected,
    required this.canSelectMore,
    required this.onSelectionChanged,
    required this.expanded,
  });

  final ManagerSummary manager;
  final String? link;
  final bool isSelected;
  final bool canSelectMore;
  final bool expanded;
  final ValueChanged<bool> onSelectionChanged;

  @override
  Widget build(BuildContext context, ref) {
    final link = this.link;
    return link == null
        ? CheckboxListTile.adaptive(
            checkboxScaleFactor: .9,
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            enabled: isSelected || canSelectMore,
            title: Text(
              manager.name,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            value: isSelected,
            onChanged: (val) => onSelectionChanged(!isSelected),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: !expanded
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: .1)
                  : null,
              borderRadius: BorderRadius.circular(12),
            ),
            // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    ref
                        .read(expandCollpseResetManagerProvider.notifier)
                        .toggleItem(manager.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        manager.name,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          expanded
                              ? Icons.expand_more_outlined
                              : Icons.expand_less_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                ExpandableItem(
                  isExpanded: !expanded,
                  childWidget: ResetManagerShareLinkSuccessView(
                    link: link,
                    managerID: manager.id,
                  ),
                ),
              ],
            ),
          );
  }
}




// import 'package:flutter/material.dart';
// import 'package:oven/models/manager_summary.dart';
// import 'package:oven/widgets/requests_page_widgets/edit_managers_request/reset_manager_request/reset_manager_share_link_success_view.dart';

// class ResetManagerItem extends StatelessWidget {
//   const ResetManagerItem({
//     super.key,
//     required this.manager,
//     required this.link,
//     required this.isSelected,
//     required this.canSelectMore,
//     required this.onSelectionChanged,
//   });

//   final ManagerSummary manager;
//   final String? link;
//   final bool isSelected;
//   final bool canSelectMore;
//   final ValueChanged<bool> onSelectionChanged;

//   @override
//   Widget build(BuildContext context) {
//     final link = this.link;
//     return Container(
//       // margin: EdgeInsets.symmetric(vertical: 2),
//       child: Column(
//         children: [
//           link == null
//               ? CheckboxListTile.adaptive(
//                   checkboxScaleFactor: .9,
//                   // visualDensity: VisualDensity.compact,
//                   enabled: link == null && (isSelected || canSelectMore),
//                   dense: true,
//                   title: Text(
//                     manager.name,
//                     style: Theme.of(context).textTheme.labelLarge,
//                   ),
//                   value: isSelected,
//                   onChanged: (val) => onSelectionChanged(!isSelected),
//                   contentPadding: EdgeInsets.only(left: 15, right: 7),
//                 )
//               : ExpansionTile(
//                   onExpansionChanged: (value) {
//                     if (value) {
//                       expansibleController.collapse();
//                     } else {
//                       expansibleController.expand();
//                     }
//                   },
//                   visualDensity: VisualDensity.compact,
//                   controller: expansibleController,
//                   initiallyExpanded: true,
//                   title: Text(
//                     manager.name,
//                     style: Theme.of(context).textTheme.labelLarge,
//                   ),
//                   tilePadding: EdgeInsets.symmetric(horizontal: 15),
//                   dense: true,
//                   children: [
//                     ResetManagerShareLinkSuccessView(
//                       link: link,
//                       managerID: manager.id,
//                     ),
//                   ],
//                 ),
//         ],
//       ),
//     );
//   }
// }