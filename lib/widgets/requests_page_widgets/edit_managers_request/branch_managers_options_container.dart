import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';

class BranchManagersOptionsContainer extends StatefulWidget {
  const BranchManagersOptionsContainer({super.key});
  @override
  State<BranchManagersOptionsContainer> createState() =>
      _BranchManagersOptionsContainerState();
}

class _BranchManagersOptionsContainerState
    extends State<BranchManagersOptionsContainer> {
  String secondaryTitle = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RequestsPageHeader(title: "Managers settings"),
        // SizedBox(height: 20),
        Column(
          children: [
            AccountPageWidgetChildContainerItem(
              key: ValueKey("addNewManager"),
              icon: Icons.add,
              onTap: () {
                context.go("/account/request/managerSettings/addManager");
                setState(() {
                  secondaryTitle = "add manager";
                });
              },
              title: "Add new manager",
            ),

            AccountPageWidgetChildContainerItem(
              key: ValueKey("resetManagerCredentials"),
              icon: Icons.edit,
              onTap: () {
                context.go("/account/request/managerSettings/resetManager");
                setState(() {
                  secondaryTitle = "reset manager";
                });
              },
              title: "Reset manager",
            ),
            AccountPageWidgetChildContainerItem(
              key: ValueKey("deleteManager"),
              icon: Icons.delete,
              onTap: () {
                context.go("/account/request/managerSettings/deleteManager");
                setState(() {
                  secondaryTitle = "delete manager";
                });
              },
              title: "Delete manager",
            ),
            AccountPageWidgetChildContainerItem(
              key: ValueKey("editManagerCredentials"),
              icon: Icons.edit,
              onTap: () {
                context.go("/account/request/managerSettings/editManager");
                setState(() {
                  secondaryTitle = "edit manager";
                });
              },
              title: "Edit manager",
            ),
          ],
        ),
      ],
    );
  }
}
