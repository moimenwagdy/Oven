import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/models/devlivery_address_option.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class AddressOptionsChangeEdit extends StatelessWidget {
  final DeliveryAddressOption branch;

  const AddressOptionsChangeEdit({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 85,
            height: context.isSmallDevice ? 30 : 35,
            child: FormSubmitButtom(
              textChild: Text(
                "Edit",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12,
                ),
              ),
              onPressed: () {
                context.goNamed(
                  "editAddress",
                  queryParameters: {"branchID": branch.id, "edit": "true"},
                );
              },
            ),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 85,
            height: context.isSmallDevice ? 30 : 35,
            child: FormSubmitButtom(
              textChild: Text(
                "Change",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12,
                ),
              ),
              onPressed: () {
                context.goNamed(
                  "editAddress",
                  queryParameters: {"branchID": branch.id, "edit": "false"},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
