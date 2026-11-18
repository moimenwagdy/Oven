import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oven/models/devlivery_address_option.dart';
import 'package:oven/pages/account_pages/map_page.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/fake_database/fake_database.dart';
import 'package:oven/providers/profile_actions_provider/edit_adress_form_notifier.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class AddressOptionsChangeEdit extends ConsumerWidget {
  final DeliveryAddressOption branch;
  final bool? isManagerAddresss;
  const AddressOptionsChangeEdit({
    super.key,
    required this.branch,
    this.isManagerAddresss = false,
  });
  @override
  Widget build(BuildContext context, ref) {
    final branchId = branch.id.substring(branch.id.indexOf(":") + 1);
    final currentManagerId = ref.watch(currentUserIdProvider);
    final currentbranchAddress = isManagerAddresss == false
        ? ref
              .watch(fakeDatabaseProvider)
              .branches
              .firstWhere((ele) => ele.id == branchId)
              .location
        : ref
              .watch(fakeDatabaseProvider)
              .managers
              .firstWhere((ele) => ele.id == currentManagerId)
              .address;
    if (isManagerAddresss != null) {
      print(" from editing manager address route $currentManagerId");
    }
    return Container(
      height: 80,
      width: double.infinity,
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
            width: 95,
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
                ref
                    .read(editAddressFormProvider.notifier)
                    .initiateToEdit(currentbranchAddress!);
                context.goNamed(
                  "editAddress",
                  queryParameters: {
                    "branchID": branchId,
                    "edit": "true",
                    "isManagerAddress": isManagerAddresss == true
                        ? "true"
                        : "false",
                  },
                );
                openMapPage(
                  context,
                  LatLng(
                    currentbranchAddress.latitude,
                    currentbranchAddress.longitude,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 15),
          SizedBox(
            width: 95,
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
                  queryParameters: {
                    "branchID": branchId,
                    "edit": "false",
                    "isManagerAddress": isManagerAddresss == true
                        ? "true"
                        : "false",
                  },
                );
                openMapPage(context, null);
              },
            ),
          ),
        ],
      ),
    );
  }
}

void openMapPage(BuildContext context, LatLng? currentbranchAddress) {
  showGeneralDialog(
    context: context,
    barrierColor: Theme.of(context).colorScheme.onPrimary,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Column(
        children: [
          MapPage(
            onCameraMove: (p0) {},
            initialLocation: CameraPosition(
              target: currentbranchAddress ?? LatLng(0, 0),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: FormSubmitButtom(
              textChild: Text(
                "Select Location",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: onPrimary),
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
