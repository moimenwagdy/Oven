import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/user_dispaly_info.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/requests_page_widgets/edit_managers_request/add_new_manager/add_manager_share_link_success_view.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/function.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';

class AddNewManager extends ConsumerStatefulWidget {
  const AddNewManager({super.key});

  @override
  ConsumerState<AddNewManager> createState() => _AddNewManagerState();
}

class _AddNewManagerState extends ConsumerState<AddNewManager> {
  String? generatedLink;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    final isLoggedin = ref.watch(fakeAuthProvider).value;
    final loggedInData = extractUserInfo(isLoggedin);
    final branchID = loggedInData?.branchId;
    return Column(
      children: [
        RequestsPageHeader(
          title: "Managers settings",
          secondrayTitle: "add manager",
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
            onPressed: () async {
              try {
                final link = await buildChottuShareLink(id: "NM-$branchID!");
                setState(() {
                  generatedLink = link;
                });
              } catch (error) {
                setState(() {
                  errorMessage = error.toString();
                });
              }
            },
          ),
        ),
        if (generatedLink != null)
          AddManagerShareLinkSuccessView(link: generatedLink!),
        if (errorMessage != null) Text(errorMessage!),
      ],
    );
  }
}
