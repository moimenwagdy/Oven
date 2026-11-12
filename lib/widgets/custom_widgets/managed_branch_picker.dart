import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/branch.dart';
import 'package:oven/providers/authentication_provider/managed_branch.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';

/// A checkbox per branch plus "Select all". Hidden when there are fewer
/// than 2 branches. `scope` says which screen's selection it controls.
class ManagedBranchesPicker extends ConsumerWidget {
  final BranchSelectionScope scope;
  final bool disabled;
  final String title;

  const ManagedBranchesPicker({
    super.key,
    required this.scope,
    this.disabled = false,
    this.title = "Choose the branches.",
  });

  static const _selectAllValue = '__select_all__';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branches =
        ref.watch(accessibleBranchesProvider).value ?? const <Branch>[];
    if (branches.length < 2) return const SizedBox.shrink();

    final selectedIds = ref.watch(managedBranchIdsProvider(scope));
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(12);
    final accent = disabled
        ? theme.colorScheme.onSurface
        : theme.colorScheme.primary;

    final selected = [
      for (final b in branches)
        if (selectedIds.contains(b.id)) b,
    ];
    final summary = selected.length == branches.length
        ? 'All branches'
        : selected.map((b) => b.name).join(', ');

    // The open menu is a separate route and does not rebuild with this
    // widget, so every row watches the selection itself.
    final items = <DropdownMenuItem<String>>[
      DropdownMenuItem<String>(
        value: _selectAllValue,
        enabled: false,
        child: Consumer(
          builder: (context, ref, _) {
            final current = ref.watch(managedBranchIdsProvider(scope));
            final notifier = ref.read(
              managedBranchesSelectionProvider(scope).notifier,
            );
            final allSelected = current.length == branches.length;
            return _CheckRow(
              text: allSelected ? 'Deselect all' : 'Select all',
              checked: allSelected ? true : false,
              emphasized: true,
              onTap: () {
                if (allSelected) {
                  notifier.clearAll();
                } else {
                  notifier.selectAll();
                }
              },
            );
          },
        ),
      ),
      for (final b in branches)
        DropdownMenuItem<String>(
          value: b.id,
          enabled: false,
          child: Consumer(
            builder: (context, ref, _) {
              final isChecked = ref
                  .watch(managedBranchIdsProvider(scope))
                  .contains(b.id);
              return _CheckRow(
                text: b.name,
                checked: isChecked,
                onTap: () => ref
                    .read(managedBranchesSelectionProvider(scope).notifier)
                    .toggle(b.id),
              );
            },
          ),
        ),
    ];

    return Column(
      children: [
        Text(title, style: theme.textTheme.labelLarge),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: SizedBox(
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                // Only decides what the closed button shows.
                value: selected.isEmpty ? null : selected.first.id,
                hint: Text(
                  "No branch selected",
                  style: TextStyle(color: accent),
                ),
                items: items,
                // One entry per item, all showing the same summary.
                selectedItemBuilder: (context) => List.generate(
                  items.length,
                  (_) => Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      summary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: accent,
                      ),
                    ),
                  ),
                ),
                onChanged: disabled ? null : (_) {},
                buttonStyleData: ButtonStyleData(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    color: theme.colorScheme.surface,
                    border: Border.all(color: theme.colorScheme.outline),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down_rounded, color: accent),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  offset: const Offset(0, -4),
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    color: theme.colorScheme.surface,
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all(4),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 44,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CheckRow extends StatelessWidget {
  final String text;

  /// true = ticked, false = empty, null = some selected (the dash).
  final bool? checked;
  final bool emphasized;
  final VoidCallback onTap;

  const _CheckRow({
    required this.text,
    required this.checked,
    required this.onTap,
    this.emphasized = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOff = checked == false;
    final style = theme.textTheme.labelLarge?.copyWith(
      color: isOff ? theme.colorScheme.onSurface : theme.colorScheme.primary,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Checkbox(
              tristate: true,
              value: checked,
              onChanged: (_) => onTap(),
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(text, overflow: TextOverflow.ellipsis, style: style),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:oven/models/branch.dart';
// import 'package:oven/providers/authentication_provider/managed_branch.dart';
// import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// /// Which selection the picker controls.
// /// - lists: the filter of the reset / delete lists (starts with every branch ticked)
// /// - invite: the branches of a new-manager invitation (starts with none ticked)
// enum BranchPickerScope { lists, invite }

// extension on BranchPickerScope {
//   ProviderListenable<Set<String>> get selected => switch (this) {
//     BranchPickerScope.lists => managedBranchIdsProvider,
//     BranchPickerScope.invite => inviteBranchIdsProvider,
//   };

//   void toggle(WidgetRef ref, String branchId) {
//     switch (this) {
//       case BranchPickerScope.lists:
//         ref.read(managedBranchesSelectionProvider.notifier).toggle(branchId);
//       case BranchPickerScope.invite:
//         ref.read(inviteBranchesSelectionProvider.notifier).toggle(branchId);
//     }
//   }

//   void selectAll(WidgetRef ref) {
//     switch (this) {
//       case BranchPickerScope.lists:
//         ref.read(managedBranchesSelectionProvider.notifier).selectAll();
//       case BranchPickerScope.invite:
//         ref.read(inviteBranchesSelectionProvider.notifier).selectAll();
//     }
//   }

//   void clearAll(WidgetRef ref) {
//     switch (this) {
//       case BranchPickerScope.lists:
//         ref.read(managedBranchesSelectionProvider.notifier).clearAll();
//       case BranchPickerScope.invite:
//         ref.read(inviteBranchesSelectionProvider.notifier).clearAll();
//     }
//   }
// }

// /// A checkbox per branch plus "Select all". Hidden when there are fewer
// /// than 2 branches.
// class ManagedBranchesPicker extends ConsumerWidget {
//   final bool disabled;
//   final BranchPickerScope scope;
//   final String title;

//   const ManagedBranchesPicker({
//     super.key,
//     this.disabled = false,
//     this.scope = BranchPickerScope.lists,
//     this.title = "Choose the branches.",
//   });

//   static const _selectAllValue = '__select_all__';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final branches =
//         ref.watch(accessibleBranchesProvider).value ?? const <Branch>[];
//     if (branches.length < 2) return const SizedBox.shrink();

//     final selectedIds = ref.watch(scope.selected);
//     final theme = Theme.of(context);
//     final radius = BorderRadius.circular(12);
//     final accent = disabled
//         ? theme.colorScheme.onSurface
//         : theme.colorScheme.primary;

//     final selected = [
//       for (final b in branches)
//         if (selectedIds.contains(b.id)) b,
//     ];
//     final summary = selected.length == branches.length
//         ? 'All branches'
//         : selected.map((b) => b.name).join(', ');

//     // The open menu is a separate route and does not rebuild with this
//     // widget, so every row watches the selection itself.
//     final items = <DropdownMenuItem<String>>[
//       DropdownMenuItem<String>(
//         value: _selectAllValue,
//         enabled: false, // keeps the menu open when a row is tapped
//         child: Consumer(
//           builder: (context, ref, _) {
//             final current = ref.watch(scope.selected);
//             final allSelected = current.length == branches.length;
//             return _CheckRow(
//               text: 'Select all',
//               checked: allSelected ? true : false,
//               onTap: () {
//                 if (allSelected) {
//                   scope.clearAll(ref);
//                 } else {
//                   scope.selectAll(ref);
//                 }
//               },
//             );
//           },
//         ),
//       ),
//       for (final b in branches)
//         DropdownMenuItem<String>(
//           value: b.id,
//           enabled: false,
//           child: Consumer(
//             builder: (context, ref, _) {
//               final isChecked = ref.watch(scope.selected).contains(b.id);
//               return _CheckRow(
//                 text: b.name,
//                 checked: isChecked,
//                 onTap: () => scope.toggle(ref, b.id),
//               );
//             },
//           ),
//         ),
//     ];

//     return Column(
//       children: [
//         Text(title, style: theme.textTheme.labelLarge),
//         const SizedBox(height: 10),
//         ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 320),
//           child: SizedBox(
//             width: double.infinity,
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton2<String>(
//                 isExpanded: true,
//                 // Only decides what the closed button shows.
//                 value: selected.isEmpty ? null : selected.first.id,
//                 hint: Text(
//                   "No branch selected",
//                   style: TextStyle(color: accent),
//                 ),
//                 items: items,
//                 // One entry per item, all showing the same summary.
//                 selectedItemBuilder: (context) => List.generate(
//                   items.length,
//                   (_) => Align(
//                     alignment: AlignmentDirectional.centerStart,
//                     child: Text(
//                       summary,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: theme.textTheme.labelLarge?.copyWith(
//                         color: accent,
//                       ),
//                     ),
//                   ),
//                 ),
//                 onChanged: disabled ? null : (_) {},
//                 buttonStyleData: ButtonStyleData(
//                   height: 40,
//                   padding: const EdgeInsets.symmetric(horizontal: 14),
//                   decoration: BoxDecoration(
//                     borderRadius: radius,
//                     color: theme.colorScheme.surface,
//                     border: Border.all(
//                       color: theme.colorScheme.onSurface.withValues(alpha: .5),
//                     ),
//                   ),
//                 ),
//                 iconStyleData: IconStyleData(
//                   icon: Icon(Icons.keyboard_arrow_down_rounded, color: accent),
//                 ),
//                 dropdownStyleData: DropdownStyleData(
//                   maxHeight: 300,
//                   offset: const Offset(0, -4),
//                   decoration: BoxDecoration(
//                     borderRadius: radius,
//                     color: theme.colorScheme.surface,
//                   ),
//                   scrollbarTheme: ScrollbarThemeData(
//                     radius: const Radius.circular(40),
//                     thickness: WidgetStateProperty.all(4),
//                   ),
//                 ),
//                 menuItemStyleData: const MenuItemStyleData(
//                   height: 44,
//                   padding: EdgeInsets.zero,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _CheckRow extends StatelessWidget {
//   final String text;

//   /// true = ticked, false = empty, null = some selected (the dash).
//   final bool? checked;
//   final VoidCallback onTap;

//   const _CheckRow({
//     required this.text,
//     required this.checked,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final isOff = checked == false;
//     final style = theme.textTheme.labelLarge?.copyWith(
//       color: isOff ? theme.colorScheme.onSurface : theme.colorScheme.primary,
//     );

//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 14),
//         child: Row(
//           children: [
//             Checkbox(
//               value: checked,
//               onChanged: (_) => onTap(),
//               visualDensity: VisualDensity.compact,
//               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Text(text, overflow: TextOverflow.ellipsis, style: style),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
