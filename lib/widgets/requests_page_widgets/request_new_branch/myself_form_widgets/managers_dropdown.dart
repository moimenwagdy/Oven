import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/models/manager_summary.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/invite_new_manager_button.dart';

class ManagersDropdown extends ConsumerStatefulWidget {
  final TextEditingController managerController;

  const ManagersDropdown({super.key, required this.managerController});

  @override
  ConsumerState<ManagersDropdown> createState() => _ManagersDropdownState();
}

class _ManagersDropdownState extends ConsumerState<ManagersDropdown> {
  // Search text only. The caller's controller changes on selection, never
  // while typing, and a previous selection does not filter the list.
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final managersAsync = ref.watch(trademarkBranchManagersProvider);

    // The signed-in manager, so they can pick themselves even when they are
    // not a branch manager (the trademark admin and trademark managers are
    // not in the list).
    final session = ref.watch(currentSessionProvider);
    final me = session is ManagerSession
        ? ManagerSummary(
            id: session.id,
            name: session.name,
            email: session.email,
            phone: session.phone,
          )
        : null;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _searchController,
          builder: (context, value, _) {
            final query = value.text.trim().toLowerCase();
            return Column(
              children: [
                TextField(
                  controller: _searchController,
                  autofocus: true,
                  style: Theme.of(context).textTheme.labelLarge,
                  decoration: InputDecoration(
                    hintText: "Search manager",
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    suffixIcon: value.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: _searchController.clear,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: managersAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Center(child: Text(error.toString())),
                    data: (managers) {
                      // "Myself" first, and only once, even if the user is
                      // already a branch manager in the list.
                      final all = [
                        if (me != null) me,
                        for (final m in managers)
                          if (m.id != me?.id) m,
                      ];
                      final filtered = all
                          .where((m) => m.name.toLowerCase().contains(query))
                          .toList();

                      return ListView(
                        padding: EdgeInsets.zero,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: InviteNewManagerButton(
                              onPressed: () {
                                widget.managerController.text =
                                    "Invite New Manager";
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          if (filtered.isEmpty)
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  all.isEmpty
                                      ? "No managers yet"
                                      : "No manager match",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            )
                          else
                            for (final manager in filtered)
                              ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                title: Text(
                                  manager.name,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                onTap: () {
                                  widget.managerController.text = manager.name;
                                  Navigator.pop(context, manager);
                                },
                              ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
