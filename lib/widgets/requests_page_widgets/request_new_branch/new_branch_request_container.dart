import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/requests_page_widgets/requests_page_header.dart';

class NewBranchRequestContainer extends StatelessWidget {
  const NewBranchRequestContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RequestsPageHeader(title: context.l10n.createNewBranch),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              context.l10n.newBranchMessage,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          SizedBox(height: 50),
          Column(
            spacing: 10,
            children: [
              SizedBox(
                width: 200,
                height: 40,
                child: FormSubmitButtom(
                  onPressed: () {
                    context.go("/account/request/newBranch/mySelf");
                  },
                  textChild: Text(
                    context.l10n.mysef,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: FormSubmitButtom(
                  onPressed: () {
                    context.go("/account/request/newBranch/otherPerson");
                  },
                  textChild: Text(
                    context.l10n.otherPerson,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
