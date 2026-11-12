import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/branch.dart';
import 'package:oven/models/manager_assignment.dart';
import 'package:oven/providers/authentication_provider/managed_branch.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
import 'package:oven/providers/managers_provider/expand_collapse_edit_manager_screen_proivder.dart';
import 'package:oven/providers/managers_provider/manager_assignment_provider.dart';
import 'package:oven/widgets/custom_widgets/expandable_item.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom_widgets/managed_branch_picker.dart';
import 'package:oven/widgets/requests_page_widgets/edit_managers_request/expand_collapse_all_button.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';

/// Assigns managers to branches. The picker filters the managers, each
/// manager row has a checkbox per branch the user can change, and one Save
/// applies every edited row at once.
class ManagerBranchesAssignment extends ConsumerStatefulWidget {
  const ManagerBranchesAssignment({super.key});

  @override
  ConsumerState<ManagerBranchesAssignment> createState() =>
      _ManagerBranchesAssignmentState();
}

class _ManagerBranchesAssignmentState
    extends ConsumerState<ManagerBranchesAssignment> {
  static const _scope = BranchSelectionScope.assign;

  bool _saving = false;
  String? _error;
  Set<String> _problemIds = {};

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
      _problemIds = {};
    });

    final result = await ref
        .read(managerAssignmentActionsProvider.notifier)
        .save();

    if (!mounted) return;
    setState(() {
      _saving = false;
      _error = result.errorMessage;
      _problemIds = result.problemManagerIds;
    });
  }

  Widget _message(String text) =>
      Center(child: Text(text, style: Theme.of(context).textTheme.labelLarge));

  @override
  Widget build(BuildContext context) {
    // Fixing a row clears the old error.
    ref.listen<Map<String, Set<String>>>(managerAssignmentEditsProvider, (
      previous,
      next,
    ) {
      if (_error != null || _problemIds.isNotEmpty) {
        setState(() {
          _error = null;
          _problemIds = {};
        });
      }
    });

    final branchesAsync = ref.watch(accessibleBranchesProvider);
    final branches = branchesAsync.value ?? const <Branch>[];
    final branchIds = ref.watch(managedBranchIdsProvider(_scope));
    final managersAsync = ref.watch(visibleAssignableManagersProvider);
    final editedCount = ref.watch(managerAssignmentEditsProvider).length;
    final myId = ref.watch(currentUserIdProvider);
    final theme = Theme.of(context);
    final expandedIds = ref.watch(expandCollapseEditManagerScreenProvider);
    final Widget content;
    if (branchesAsync.isLoading && branches.isEmpty) {
      content = const Center(child: CircularProgressIndicator());
    } else if (branchIds.isEmpty) {
      content = _message("No branch selected");
    } else {
      content = managersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (managers) {
          if (managers.isEmpty) return _message("No managers to show");
          return Column(
            children: [
              ExpandCollapseAllButton(
                title: expandedIds.isNotEmpty ? "Collapse all" : "Expand all",
                onPressed: managers.isEmpty
                    ? null
                    : () => ref
                          .read(
                            expandCollapseEditManagerScreenProvider.notifier,
                          )
                          .toggleAll(),
              ),
              SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: managers.length,
                  itemBuilder: (context, index) {
                    final manager = managers[index];

                    return _ManagerCard(
                      key: ValueKey(manager.id),
                      manager: manager,
                      expanded: expandedIds.contains(manager.id),
                      branches: branches,
                      isMe: manager.id == myId,
                      saving: _saving,
                      hasProblem: _problemIds.contains(manager.id),
                    );
                  },
                ),
              ),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        RequestsPageHeader(
          title: "Managers settings",
          secondrayTitle: "edit managers",
        ),
        const SizedBox(height: 20),
        const ManagedBranchesPicker(
          scope: _scope,
          title: "Show the managers of these branches.",
        ),
        const SizedBox(height: 10),
        Expanded(child: content),
        const SizedBox(height: 10),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _error!,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          height: 40,
          child: FormSubmitButtom(
            textChild: Text(
              _saving
                  ? "Saving..."
                  : (editedCount == 0 ? "Save" : "Save ($editedCount)"),
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            onPressed: _saving || editedCount == 0 ? null : _save,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _ManagerCard extends ConsumerWidget {
  final ManagerAssignment manager;
  final List<Branch> branches;
  final bool isMe;
  final bool saving;
  final bool hasProblem;
  final bool expanded;

  const _ManagerCard({
    super.key,
    required this.manager,
    required this.branches,
    required this.isMe,
    required this.saving,
    required this.hasProblem,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ticked = ref.watch(tickedBranchIdsProvider(manager.id));
    final edited = ref
        .watch(managerAssignmentEditsProvider)
        .containsKey(manager.id);

    // You never change your own row.
    final canEdit = !isMe && !saving;
    final allTicked =
        branches.isNotEmpty && branches.every((b) => ticked.contains(b.id));

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: expanded
            ? theme.colorScheme.primary.withValues(alpha: .1)
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              ref
                  .read(expandCollapseEditManagerScreenProvider.notifier)
                  .toggleItem(manager.id);
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          manager.name,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (manager.isTrademarkManager)
                          const _Tag("Trademark manager"),
                        if (isMe) const _Tag("You"),
                        const Spacer(),
                        Icon(
                          expanded
                              ? Icons.expand_less_outlined
                              : Icons.expand_more_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ExpandableItem(
            isExpanded: expanded,
            childWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMe)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "You can't change your own branches.",
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                if (manager.outsideScopeCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Also manages ${manager.outsideScopeCount} other "
                      "${manager.outsideScopeCount == 1 ? 'branch' : 'branches'} "
                      "you can't change.",
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                Stack(
                  alignment: AlignmentGeometry.topRight,
                  children: [
                    Column(
                      children: [
                        CheckboxListTile(
                          checkboxScaleFactor: .9,
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            allTicked ? "Deselect all" : "Select all",
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // null shows the "some selected" dash
                          value: allTicked ? true : false,
                          onChanged: canEdit
                              ? (_) {
                                  final edits = ref.read(
                                    managerAssignmentEditsProvider.notifier,
                                  );
                                  if (allTicked) {
                                    edits.clearAll(manager.id);
                                  } else {
                                    edits.selectAll(manager.id);
                                  }
                                }
                              : null,
                        ),
                        for (final branch in branches)
                          CheckboxListTile(
                            checkboxScaleFactor: .9,
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              branch.name,
                              style: theme.textTheme.labelLarge,
                            ),
                            value: ticked.contains(branch.id),
                            onChanged: canEdit
                                ? (_) => ref
                                      .read(
                                        managerAssignmentEditsProvider.notifier,
                                      )
                                      .toggle(manager.id, branch.id)
                                : null,
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: Column(
                        children: [
                          if (edited && canEdit)
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              tooltip: "Undo changes",
                              icon: Icon(
                                Icons.undo,
                                color: theme.colorScheme.primary,
                                size: 15,
                              ),
                              onPressed: () => ref
                                  .read(managerAssignmentEditsProvider.notifier)
                                  .discard(manager.id),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (hasProblem)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "Needs at least one branch.",
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag(this.text);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
