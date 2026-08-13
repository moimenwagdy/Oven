import 'package:flutter/material.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/request_container.dart';
import 'package:oven/widgets/account_page_widgets/account_page_widget_child_container_item.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  RequestType? showList;
  Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    switch (showList) {
      case RequestType.requestNewBranch:
        childWidget = RequestContainer();
        break;
      default:
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: showList == null
          ? Column(
              children: [
                AccountPageWidgetChildContainerItem(
                  key: ValueKey("requestNewBranch"),
                  icon: Icons.request_page,
                  onTap: () {
                    setState(() {
                      showList = RequestType.requestNewBranch;
                    });
                  },
                  title: "Request New Branch",
                ),
              ],
            )
          : childWidget,
    );
  }
}

enum RequestType { requestNewBranch }
