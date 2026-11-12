import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/where_to_devliver_provider/delivery_options_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/profile_page_widgets/profile_data/profile_address_section/profile_address_section.dart';
import 'package:oven/widgets/profile_page_widgets/profile_data/profile_email_section.dart';
import 'package:oven/widgets/profile_page_widgets/profile_data/profile_name_section.dart';
import 'package:oven/widgets/profile_page_widgets/profile_data/profile_phone_section.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';

class ProfilePageSections extends ConsumerWidget {
  const ProfilePageSections({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final session = ref.watch(currentSessionProvider);
    if (session == null) return const SizedBox.shrink();
    final options = ref.watch(deliveryOptionsProvider).value ?? [];
    final branchAddresses = options.where((o) => o.id.startsWith('branch:'));
    final personalAddress = options
        .where((o) => o.id == 'owner' || o.id == 'personal')
        .firstOrNull;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(5),
        width: context.screenWidth,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              ProfileNameSection(),
              ProfileEmailSection(),
              ProfilePhoneSection(),
              for (final branch in branchAddresses)
                ProfileAddressSection(branch: branch),
              if (personalAddress != null)
                ProfilePageSection(
                  sectionTitle: context.l10n.personalAddress,
                  sectionData: personalAddress.label,
                  branchID: personalAddress.id,
                  onClick: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
