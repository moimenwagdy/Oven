import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/managers_provider/managers_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';

class DeleteManagersList extends ConsumerStatefulWidget {
  const DeleteManagersList({super.key});

  @override
  ConsumerState<DeleteManagersList> createState() => _DeleteManagersListState();
}

class _DeleteManagersListState extends ConsumerState<DeleteManagersList> {
  List<String> selectedIds = [];
  bool showSuccessMessage = false;
  @override
  Widget build(BuildContext context) {
    final managerList = ref.watch(managersListProvider);
    return Column(
      children: [
        RequestsPageHeader(
          title: "Managers settings",
          secondrayTitle: "delete manager",
        ),
        SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.screenHeight * .38,
            maxHeight: context.screenHeight * .38,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final manager in managerList)
                  CheckboxListTile.adaptive(
                    title: Text(
                      manager.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    value: selectedIds.contains(manager.id),
                    onChanged: (value) {
                      setState(() {
                        if (selectedIds.contains(manager.id)) {
                          selectedIds.remove(manager.id);
                        } else {
                          if (selectedIds.length == (managerList.length - 1))
                            return;
                          selectedIds.add(manager.id);
                        }
                      });
                    },
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
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
            onPressed: () {
              if (managerList.length == 1) return;
              ref
                  .read(managersListProvider.notifier)
                  .deleteMultiManager(selectedIds);
              setState(() {
                showSuccessMessage = true;
                selectedIds = [];
              });
            },
          ),
        ),
        SizedBox(height: 40),
        if (showSuccessMessage)
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
