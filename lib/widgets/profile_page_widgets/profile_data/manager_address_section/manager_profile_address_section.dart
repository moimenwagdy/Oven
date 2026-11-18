import 'package:flutter/material.dart';
import 'package:oven/models/devlivery_address_option.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/profile_page_widgets/profile_data/profile_address_section/address_options_change_edit.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';

class ManagerProfileAddressSection extends StatefulWidget {
  final DeliveryAddressOption managerAddress;
  const ManagerProfileAddressSection({super.key, required this.managerAddress});

  @override
  State<ManagerProfileAddressSection> createState() =>
      _ManagerProfileAddressSectionState();
}

class _ManagerProfileAddressSectionState
    extends State<ManagerProfileAddressSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.centerStart,
      children: [
        ProfilePageSection(
          sectionTitle: context.l10n.personalAddress,
          sectionData: widget.managerAddress.label,
          branchID: widget.managerAddress.id,
          onClick: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddressOptionsChangeEdit(
                  branch: widget.managerAddress,
                  isManagerAddresss: true,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
