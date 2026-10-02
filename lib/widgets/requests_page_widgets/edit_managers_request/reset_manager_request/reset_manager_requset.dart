import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/managers_provider/managers_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/requests_page_widgets/edit_managers_request/reset_manager_request/reset_manager_share_link_success_view.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/function.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';

class ResetManagerRequset extends ConsumerStatefulWidget {
  const ResetManagerRequset({super.key});
  @override
  ConsumerState<ResetManagerRequset> createState() =>
      _ResetManagerRequsetState();
}

class _ResetManagerRequsetState extends ConsumerState<ResetManagerRequset>
    with AutomaticKeepAliveClientMixin {
  // static => survives this widget being disposed and rebuilt when the user
  // navigates away and comes back (lives for the app session).
  static final Set<String> _underReset = {};
  String generatedLink = "";
  String? errorMessage;
  final _scollcontroller = ScrollController();
  @override
  bool get wantKeepAlive => true; // keeps state alive inside tabs/PageView/lists

  String? selectedId;
  bool showSuccessMessage = false;

  void _onSelect(String id, bool? value) {
    setState(() {
      selectedId = value == true
          ? id
          : null; // single selection, tap again to unselect
    });
  }

  void _onReset() async {
    final id = selectedId;
    if (id == null) return;

    // TODO: send the reset request here
    try {
      final link = await buildChottuShareLink(id: "NM-branchId");
      setState(() {
        generatedLink = link;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
      });
    }

    setState(() {
      _underReset.add(id);
      // selectedId = null;
      showSuccessMessage = true;
    });
  }

  @override
  void dispose() {
    _scollcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final managerList = ref.watch(managersListProvider);
    final canReset =
        selectedId != null && !showSuccessMessage && managerList.length > 1;
    final selectedManagersIndex = managerList.indexWhere(
      (manager) => manager.id == selectedId,
    );
    final selectedManager = selectedManagersIndex != -1
        ? managerList[selectedManagersIndex]
        : null;
    return SingleChildScrollView(
      child: Column(
        children: [
          RequestsPageHeader(
            title: "Managers settings",
            secondrayTitle: "reset manager",
          ),
          const SizedBox(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: context.isSmallDevice
                  ? context.screenHeight * .34
                  : context.screenHeight * .37,
              maxHeight: context.isSmallDevice
                  ? context.screenHeight * .34
                  : context.screenHeight * .37,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Scrollbar(
                controller: _scollcontroller,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final manager in managerList)
                        CheckboxListTile.adaptive(
                          key: ValueKey(manager.id),
                          dense: context.isSmallDevice,
                          enabled:
                              !showSuccessMessage &&
                              !_underReset.contains(manager.id),
                          title: Text(
                            manager.name,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          value: selectedId == manager.id,
                          onChanged: (value) => _onSelect(manager.id, value),
                        ),
                    ],
                  ),
                ),
              ),
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
              onPressed: canReset ? _onReset : null,
            ),
          ),
          const SizedBox(height: 25),
          if (showSuccessMessage)
            Column(
              children: [
                SizedBox(
                  width: context.screenWidth * .8,
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        "Resetting manager  \" ${selectedManager?.name ?? ""} \" request is sent to the Oven Admin. The action will be completed soon.",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Share the generated link to \" ${selectedManager?.name ?? ""} \" to complete the proccess",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                ResetManagerShareLinkSuccessView(link: generatedLink),
              ],
            ),
        ],
      ),
    );
  }
}
