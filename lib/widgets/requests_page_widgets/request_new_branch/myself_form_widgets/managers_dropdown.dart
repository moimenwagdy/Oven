import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:oven/providers/managers_provider/managers_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/invite_new_manager_button.dart';

class ManagersDropdown extends ConsumerStatefulWidget {
  final TextEditingController managerController;

  const ManagersDropdown({super.key, required this.managerController});

  @override
  ConsumerState<ManagersDropdown> createState() => _ManagersDropdownState();
}

class _ManagersDropdownState extends ConsumerState<ManagersDropdown> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();

      // Force RawAutocomplete to refresh options
      widget.managerController.text = widget.managerController.text;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final managersList = ref.watch(managersListProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RawAutocomplete<Object>(
          textEditingController: widget.managerController,
          focusNode: focusNode,
          optionsBuilder: (TextEditingValue value) {
            if (value.text.isEmpty) {
              return managersList;
            }
            final results = managersList.where((manager) {
              return manager.name.toLowerCase().contains(
                value.text.toLowerCase(),
              );
            }).toList();
            if (results.isEmpty) {
              return ["NO_RESULTS"];
            }
            return results;
          },
          displayStringForOption: (option) {
            if (option is Manager) {
              return option.name;
            }
            return "";
          },
          onSelected: (option) {
            if (option is Manager) {
              widget.managerController.text = option.name;
              Navigator.pop(context, option);
            }
          },
          fieldViewBuilder: (context, controller, focusNode, onSubmitted) {
            controller.addListener(() {
              setState(() {});
            });
            return TextField(
              controller: controller,
              focusNode: focusNode,
              style: Theme.of(context).textTheme.labelLarge,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search manager",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controller.clear();
                        },
                      )
                    : null,
              ),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            final optionsList = options.toList();
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: .5,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: context.screenWidth - 32,
                  height: context.screenHeight * .4,
                  // color: Colors.white,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: InviteNewManagerButton(
                          onPressed: () {
                            widget.managerController.text =
                                "Invite New Manager";
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      ...optionsList.map((option) {
                        if (option == "NO_RESULTS") {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: Text(
                                "No manager match",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          );
                        }

                        final manager = option as Manager;
                        return ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(
                            manager.name,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          onTap: () {
                            onSelected(manager);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
