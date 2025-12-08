import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/recent_orders_provider/recent_order_filter_provider.dart';
import 'package:oven/providers/recent_orders_provider/recent_orders_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class RecentOrdersFilter extends ConsumerWidget {
  const RecentOrdersFilter({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: 13,
    );
    final selectedValue = ref.watch(ordersFilterProvider);
    final disabled = ref
        .watch(recentOrdersListProvider)
        .when(
          data: (orders) => orders.isEmpty,
          loading: () => true,
          error: (_, __) => true,
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        SizedBox(
          width: selectedValue == null
              ? context.screenWidth * .3
              : context.screenWidth * .35,
          height: context.isSmallDevice ? 35 : 40,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                context.l10n.filter,
                style: TextStyle(color: Colors.white),
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      alignment: Alignment.center,
                      child: Text(
                        item,
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: disabled
                  ? null
                  : (value) => ref
                        .watch(ordersFilterProvider.notifier)
                        .selectedFilter(value),
              customButton: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      selectedValue ?? context.l10n.filter,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: disabled
                            ? Colors.grey
                            : selectedValue == null
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                      color: disabled
                          ? Colors.grey
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ),

              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                elevation: 2,
                offset: const Offset(0, -5),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.zero,
              ),
              onMenuStateChange: (state) => {},
            ),
          ),
        ),
        if (selectedValue != null)
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryFixed,
              borderRadius: BorderRadius.circular(50),
            ),
            child: GestureDetector(
              onTap: () => {
                ref.watch(ordersFilterProvider.notifier).selectedFilter(null),
              },
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Icon(Icons.close, size: 15),
              ),
            ),
          ),
      ],
    );
  }
}

final List<String> items = ['Delivered', 'Preparing', 'Cancelled'];
// import 'package:flutter/material.dart';

// class RecentOrdersFilter extends StatefulWidget {
//   const RecentOrdersFilter({super.key});

//   @override
//   State<RecentOrdersFilter> createState() => _RecentOrdersFilterState();
// }

// class _RecentOrdersFilterState extends State<RecentOrdersFilter> {
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
//       color: Theme.of(context).colorScheme.onSurface,
//     );
//     return Container(
//       width: 120,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Theme.of(context).colorScheme.primary),
//       ),
//       child: Center(
//         child: DropdownMenu<String>(
//           onSelected: (value) => setState(() => selectedValue = value),
//           alignmentOffset: Offset(0, 10),
//           showTrailingIcon: false,
//           inputDecorationTheme: InputDecorationTheme(
//             isDense: true,
//             border: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             contentPadding: EdgeInsets.only(
//               top: 5,
//               bottom: 5,
//               left: 0,
//               right: 0,
//             ),
//             hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//           ),
//           textStyle: textStyle,
//           hintText: 'filter ▼',

//           textAlign: TextAlign.center,
//           menuStyle: MenuStyle(
//             shape: WidgetStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             ),
//           ),
//           dropdownMenuEntries: [
//             DropdownMenuEntry(
//               style: ButtonStyle(
//                 fixedSize: WidgetStatePropertyAll(Size(120, 20)),
//               ),
//               value: "cancelled",
//               label: "Cancelled",
//             ),
//             DropdownMenuEntry(
//               style: ButtonStyle(
//                 fixedSize: WidgetStatePropertyAll(Size(120, 20)),
//               ),
//               value: "approved",
//               label: "Approved",
//             ),
//             DropdownMenuEntry(
//               style: ButtonStyle(
//                 fixedSize: WidgetStatePropertyAll(Size(120, 20)),
//               ),
//               value: "preparing",
//               label: "Preparing",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
