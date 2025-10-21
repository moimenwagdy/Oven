import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RecentOrdersFilter extends StatefulWidget {
  const RecentOrdersFilter({super.key});

  @override
  State<RecentOrdersFilter> createState() => _RecentOrdersFilterState();
}

class _RecentOrdersFilterState extends State<RecentOrdersFilter> {
  final List<String> items = ['Approved', 'Preparing', 'Cancelled'];

  String? selectedValue = null;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: 13,
    );
    return Row(
      spacing: 5,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            style: TextStyle(color: Colors.red),
            hint: Text(
              'Filter',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
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
            onChanged: (value) => setState(() => selectedValue = value),

            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 0),
              elevation: 0,
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

            iconStyleData: IconStyleData(
              icon: const Icon(Icons.arrow_drop_down),
              iconEnabledColor: Theme.of(context).colorScheme.surface,
              openMenuIcon: const Icon(Icons.arrow_drop_up),
            ),

            // 🔹 Alignment
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.zero,
            ),
          ),
        ),

        ?selectedValue != null
            ? GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedValue = null;
                  }),
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 0,
                  ),
                  child: Icon(Icons.close, size: 15),
                ),
              )
            : null,
      ],
    );
  }
}

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
