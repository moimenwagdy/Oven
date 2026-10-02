import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/utils/helpers/user_dispaly_info.dart';
import 'package:oven/utils/helpers/user_ui_data_account_and_address/extract_user_addresses.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';

class ProfilePageSections extends ConsumerWidget {
  const ProfilePageSections({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLoggedin = ref.watch(fakeAuthProvider).value;
    final info = extractUserInfo(isLoggedin);
    final businessAddress = extractUserAddresses(isLoggedin!);
    final isPersonal = info?.loggerState == LoggerState.personal;
    final isBusinessAndHasOwnerLocation =
        info?.loggerState == LoggerState.business &&
        info?.hasOwnerLocation == true;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(5),
        width: context.screenWidth,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              if (info != null)
                ProfilePageSection(
                  sectionTitle: context.l10n.userName,
                  sectionData: info.name,
                  onClick: () => {},
                ),
              if (info != null)
                ProfilePageSection(
                  sectionTitle: context.l10n.email,
                  sectionData: info.email,
                  onClick: () => {},
                ),
              if (info != null)
                ProfilePageSection(
                  sectionTitle: context.l10n.phoneNumber,
                  sectionData: info.phone.toString(),
                  onClick: () => {},
                ),
              if (info != null && !isPersonal)
                ProfilePageSection(
                  sectionTitle: context.l10n.address,
                  sectionData: businessAddress.first.label,
                  onClick: () => {},
                ),
              if ((info != null && isBusinessAndHasOwnerLocation) ||
                  (info != null && isPersonal))
                ProfilePageSection(
                  sectionTitle: context.l10n.personalAddress,
                  sectionData: businessAddress.last.label,
                  onClick: () => {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
