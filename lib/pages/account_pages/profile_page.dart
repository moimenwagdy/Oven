import 'package:flutter/material.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_header.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_sections.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.max,
            children: [ProfilePageHeader(), ProfilePageSections()],
          ),
        ),
      ),
    );
  }
}
