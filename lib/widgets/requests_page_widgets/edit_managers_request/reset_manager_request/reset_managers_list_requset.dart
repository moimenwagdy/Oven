import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/manager_summary.dart';
import 'package:oven/providers/authentication_provider/managed_branch.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/requests/reset_manager_request/expand_collapse_reset_manager_provider.dart';
import 'package:oven/providers/requests/reset_manager_request/generate_reset_links_provider.dart';
import 'package:oven/providers/requests/reset_manager_request/reset_manager_provider.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom_widgets/managed_branch_picker.dart';
import 'package:oven/widgets/requests_page_widgets/edit_managers_request/expand_collapse_all_button.dart';
import 'package:oven/widgets/requests_page_widgets/edit_managers_request/reset_manager_request/reset_manager_item.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';

const _scope = BranchSelectionScope.reset;

class ResetManagersListRequset extends ConsumerStatefulWidget {
  const ResetManagersListRequset({super.key});
  @override
  ConsumerState<ResetManagersListRequset> createState() =>
      _ResetManagersListRequsetState();
}

class _ResetManagersListRequsetState
    extends ConsumerState<ResetManagersListRequset> {
  final _scrollController = ScrollController();

  // Replaced, never mutated.
  Set<String> _selectedIds = {};

  void _onReset(List<ManagerSummary> visibleManagers, Set<String> branchIds) {
    if (_selectedIds.isEmpty) return;
    // generate() takes one branch per call, so each chosen manager goes
    // under the first selected branch they are listed on.
    final myId = ref.read(currentUserIdProvider);
    final idsByBranch = <String, List<String>>{};
    for (final manager in visibleManagers) {
      // You never reset yourself.
      if (manager.id == myId || !_selectedIds.contains(manager.id)) continue;
      final branchId = manager.branchIds.where(branchIds.contains).firstOrNull;
      if (branchId == null) continue;
      idsByBranch.putIfAbsent(branchId, () => <String>[]).add(manager.id);
    }

    final generator = ref.read(generateResetLinksProvider.notifier);
    idsByBranch.forEach((branchId, ids) => generator.generate(ids, branchId));

    setState(() => _selectedIds = {});
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Drop chosen managers that a changed branch filter no longer shows.
    ref.listen<AsyncValue<List<ManagerSummary>>>(
      branchManagersProvider(_scope),
      (previous, next) {
        final visible = next.value;
        if (visible == null) return;
        final pruned = _selectedIds.intersection({
          for (final m in visible) m.id,
        });
        if (pruned.length != _selectedIds.length) {
          setState(() => _selectedIds = pruned);
        }
      },
    );

    final branchIds = ref.watch(managedBranchIdsProvider(_scope));
    final managersAsync = ref.watch(branchManagersProvider(_scope));
    final myId = ref.watch(currentUserIdProvider);
    // You never reset yourself, so your own row is not listed.
    final visibleManagers = [
      for (final m in managersAsync.value ?? const <ManagerSummary>[])
        if (m.id != myId) m,
    ];
    final resetLinks = ref.watch(resetManagersProvider);
    final expandedIds = ref.watch(expandCollpseResetManagerProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          RequestsPageHeader(
            title: "Managers settings",
            secondrayTitle: "reset manager",
          ),
          const SizedBox(height: 25),
          const ManagedBranchesPicker(
            key: ValueKey("resetPicker"),
            scope: _scope,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ExpandCollapseAllButton(
                onPressed: resetLinks.isEmpty
                    ? null
                    : () => ref
                          .read(expandCollpseResetManagerProvider.notifier)
                          .toggleAll(),
                title: expandedIds.isEmpty ? "Collapse all" : "Expand all",
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: branchIds.isEmpty
                ? Center(
                    child: Text(
                      "No branch selected",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  )
                : managersAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Center(child: Text(error.toString())),
                    data: (_) {
                      // The same list without you.
                      final managers = visibleManagers;
                      if (managers.isEmpty) {
                        return Center(
                          child: Text(
                            "No other managers to reset",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        );
                      }

                      final availableIds = managers
                          .where((m) => !resetLinks.containsKey(m.id))
                          .map((m) => m.id)
                          .toList();

                      // You are not in this list and always stay, so any of
                      // the others can be chosen.
                      final canSelectMore =
                          _selectedIds.length < availableIds.length;
                      return Scrollbar(
                        controller: _scrollController,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              for (final manager in managers)
                                ResetManagerItem(
                                  key: ValueKey(manager.id),
                                  manager: manager,
                                  link: resetLinks[manager.id],
                                  isSelected: _selectedIds.contains(manager.id),
                                  canSelectMore: canSelectMore,
                                  expanded: expandedIds.contains(manager.id),
                                  onSelectionChanged: (selected) =>
                                      setState(() {
                                        final next = {..._selectedIds};
                                        if (selected) {
                                          if (canSelectMore) {
                                            next.add(manager.id);
                                          }
                                        } else {
                                          next.remove(manager.id);
                                        }
                                        _selectedIds = next;
                                      }),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 200,
            height: 40,
            child: FormSubmitButtom(
              textChild: Text(
                "Reset",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              onPressed: _selectedIds.isEmpty
                  ? null
                  : () {
                      _onReset(visibleManagers, branchIds);
                    },
            ),
          ),
        ],
      ),
    );
  }
}
