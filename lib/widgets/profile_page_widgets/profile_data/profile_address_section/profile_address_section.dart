import 'package:flutter/material.dart';
import 'package:oven/models/devlivery_address_option.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/profile_page_widgets/profile_data/profile_address_section/address_options_change_edit.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';

class ProfileAddressSection extends StatefulWidget {
  final DeliveryAddressOption branch;
  const ProfileAddressSection({super.key, required this.branch});

  @override
  State<ProfileAddressSection> createState() => _ProfileAddressSectionState();
}

class _ProfileAddressSectionState extends State<ProfileAddressSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.centerStart,
      children: [
        ProfilePageSection(
          sectionTitle: context.l10n.address,
          sectionData: widget.branch.label,
          branchID: widget.branch.id,
          onClick: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddressOptionsChangeEdit(branch: widget.branch);
              },
            );
          },
        ),
      ],
    );
  }
}
