import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/authentication_provider/managed_branch.dart';
import 'package:oven/providers/requests/add_manager_request/add_manager_provider.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/custom_widgets/managed_branch_picker.dart';
import 'package:oven/widgets/requests_page_widgets/edit_managers_request/add_new_manager/add_manager_share_link_success_view.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/function.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';

class AddNewManager extends ConsumerStatefulWidget {
  const AddNewManager({super.key});

  @override
  ConsumerState<AddNewManager> createState() => _AddNewManagerState();
}

class _AddNewManagerState extends ConsumerState<AddNewManager> {
  static const _maxLinks = 10;
  String? errorMessage;
  bool _isGenerating = false;

  Future<void> _generateLink(Set<String> branchIds) async {
    setState(() {
      _isGenerating = true;
      errorMessage = null;
    });

    // Sorted, so the same branches always give the same id.
    final ids = branchIds.toList()..sort();

    String? error;
    try {
      final link = await buildChottuShareLink(id: 'NM-${ids.join('_')}');
      if (!mounted) return;
      ref
          .read(addManagerGeneratedLinksProvider.notifier)
          .addGeneratedLink(link);
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;
    setState(() {
      _isGenerating = false;
      errorMessage = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final generatedLinks = ref.watch(addManagerGeneratedLinksProvider);
    final branchIds = ref.watch(
      managedBranchIdsProvider(BranchSelectionScope.invite),
    );
    final canGenerate = !_isGenerating && generatedLinks.length < _maxLinks;

    return Column(
      children: [
        RequestsPageHeader(
          title: "Managers settings",
          secondrayTitle: "add manager",
        ),
        SizedBox(height: 20),
        const ManagedBranchesPicker(
          scope: BranchSelectionScope.invite,
          title: "Choose the branches for the new manager.",
        ),
        SizedBox(height: 20),
        Text(
          "Click the button below to generate the link.",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: 25),
        SizedBox(
          width: 200,
          height: 40,
          child: FormSubmitButtom(
            textChild: Text(
              "Generate link",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onPressed: branchIds.isEmpty || !canGenerate
                ? null
                : () => _generateLink(branchIds),
          ),
        ),
        SizedBox(height: 20),
        if (generatedLinks.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final link in generatedLinks)
                    AddManagerShareLinkSuccessView(link: link),
                ],
              ),
            ),
          ),
        if (errorMessage != null) Text(errorMessage!),
      ],
    );
  }
}
