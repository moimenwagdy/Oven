import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          AccountPageWidgetChildContainerItem(
            key: ValueKey("requestNewBranch"),
            icon: Icons.request_page,
            onTap: () {
              context.go("/account/request/newBranch");
            },
            title: context.l10n.requestNewBranch,
          ),

          AccountPageWidgetChildContainerItem(
            key: ValueKey("editManagerRequest"),
            icon: Icons.request_page,
            onTap: () {
              context.go("/account/request/managerSettings");
            },
            title: "Managers settings",
          ),
        ],
      ),
    );
  }
}

enum RequestType { requestNewBranch, editManagersRequest }
