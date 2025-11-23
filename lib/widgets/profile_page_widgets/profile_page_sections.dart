import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';

class ProfilePageSections extends StatelessWidget {
  const ProfilePageSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(5),
        width: context.screenWidth,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              ProfilePageSection(
                sectionTitle: "Phone",
                sectionData: "+2-02557321",
                onClick: () => {},
              ),
              ProfilePageSection(
                sectionTitle: "Email",
                sectionData: "oven@oven.com",
                onClick: () => {},
              ),
              ProfilePageSection(
                sectionTitle: "Adress",
                sectionData:
                    "25 Nile Street, , 25 Nile Street, Zamalek,Cairo, Egypt Zamalek,Cairo, Egypt, 25 Nile Street, Zamalek,Cairo, Egypt, , 25 Nile Street, Zamalek,Cairo, Egypt , 25 Nile Street, Zamalek,Cairo, Egypt",
                onClick: () => {},
              ),
              ProfilePageSection(
                onClick: null,
                sectionTitle: "Customer Code",
                sectionData: "A44D5D",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
