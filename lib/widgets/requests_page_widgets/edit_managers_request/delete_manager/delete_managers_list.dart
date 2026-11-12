import 'package:go_router/go_router.dart';
import 'package:oven/models/manager_summary.dart';
import 'package:oven/providers/authentication_provider/managed_branch.dart';
import 'package:oven/widgets/custom_widgets/custom_dialog_alert.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom_widgets/managed_branch_picker.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/providers/requests/delete_manager_request/delete_manager_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

const _scope = BranchSelectionScope.delete;

class DeleteManagersList extends ConsumerStatefulWidget {
  const DeleteManagersList({super.key});
  @override
  ConsumerState<DeleteManagersList> createState() => _DeleteManagersListState();
}

class _DeleteManagersListState extends ConsumerState<DeleteManagersList> {
  // Replaced, never mutated.
  Set<String> _selectedIds = {};

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
    final deletedManagers = ref.watch(deletedManagersProvider);
    return Column(
      children: [
        RequestsPageHeader(
          title: "Managers settings",
          secondrayTitle: "delete manager",
        ),
        SizedBox(height: 20),
        const ManagedBranchesPicker(
          key: ValueKey("deletePicker"),
          scope: _scope,
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.screenHeight * .40,
            maxHeight: context.screenHeight * .40,
          ),
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
                  data: (managers) {
                    final availableIds = managers
                        .where((m) => !deletedManagers.contains(m.id))
                        .map((m) => m.id)
                        .toList();
                    final isLastAvailable = availableIds.length == 1;

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final manager in managers)
                            CheckboxListTile.adaptive(
                              checkboxScaleFactor: .9,
                              visualDensity: VisualDensity.compact,
                              dense: true,
                              enabled:
                                  !deletedManagers.contains(manager.id) &&
                                  !isLastAvailable,
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      manager.name,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed:
                                        deletedManagers.contains(manager.id)
                                        ? () async {
                                            await customDialogAlert(
                                              context: context,
                                              onCancel: () => context.pop(),
                                              onConfirm: () {
                                                ref
                                                    .read(
                                                      deletedManagersProvider
                                                          .notifier,
                                                    )
                                                    .undoDeletedManager(
                                                      manager.id,
                                                    );
                                                context.pop();
                                              },
                                              message: Text(
                                                "Are you sure you want to undo the deletion of ${manager.name}?",
                                              ),
                                              cancelationMessage: "Cancel",
                                              confirmationMessage: "Undo",
                                            );
                                          }
                                        : null,
                                    icon: Icon(
                                      Icons.undo,
                                      color:
                                          deletedManagers.contains(manager.id)
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              value: _selectedIds.contains(manager.id),
                              onChanged: (_) => setState(() {
                                final next = {..._selectedIds};
                                if (!next.remove(manager.id)) {
                                  // At least one manager must stay.
                                  if (next.length >= availableIds.length - 1) {
                                    return;
                                  }
                                  next.add(manager.id);
                                }
                                _selectedIds = next;
                              }),
                            ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        SizedBox(height: 40),
        // IconButton(
        //   onPressed: () {
        //     ref.read(deletedManagersProvider.notifier).deleteAll("dsf");
        //   },
        //   icon: Icon(Icons.deblur, size: 50),
        // ),
        SizedBox(
          width: 200,
          height: 40,
          child: FormSubmitButtom(
            textChild: Text(
              "Delete",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onPressed: _selectedIds.isEmpty
                ? null
                : () {
                    ref
                        .read(deletedManagersProvider.notifier)
                        .setManagerStateToDeleted(_selectedIds.toList());
                    setState(() => _selectedIds = {});
                  },
          ),
        ),
        SizedBox(height: 40),

        if (deletedManagers.isNotEmpty)
          Column(
            children: [
              SizedBox(
                width: context.screenWidth * .8,
                child: Text(
                  "Request sent to the Oven Admin. The action will be completed soon.",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
